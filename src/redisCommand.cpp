#include <boost/shared_ptr.hpp>
#include <Rcpp.h>
#include "hiredis/hiredis.h"
#include "util.hpp"
#include "RredisContext.hpp"
#include "RcppModule.hpp"

using namespace Rcpp;

static void extract_array(redisReply *node, List& retval);
static SEXP extract_reply(redisReply *r);

//'@title General Redis Interface Function
//'
//'@description Perform any Redis command
//'
//'@export
//[[Rcpp::export]]
SEXP redisCommand(std::string cmd, SEXP Rc) {
	BEGIN_RCPP
	redisContext* c(extract_ptr<RredisContext>(Rc)->get_ptr());
	boost::shared_ptr<redisReply> r((redisReply*) redisCommand(c, cmd.c_str()), std::ptr_fun<void*, void>(freeReplyObject));
	if (r.get() == NULL) {
		throw std::runtime_error(std::string(c->errstr));
	}
	return extract_reply(r.get());
	END_RCPP
}

void extract_array(redisReply *node, List& retval) {
	for(int i = 0;i < node->elements;i++) {
		retval[i] = extract_reply(node->element[i]);
	}
}

SEXP extract_reply(redisReply *r) {
	switch(r->type) {
	case REDIS_REPLY_STRING: 
	case REDIS_REPLY_STATUS: {
		std::string retval(r->str, r->len);
		return wrap(retval);
	}
	case REDIS_REPLY_ERROR: {
		std::string retval(r->str, r->len);
		throw std::runtime_error(retval.c_str());
	}
	case REDIS_REPLY_INTEGER: {
		if (r->integer > INT_MAX) {
			NumericVector retval(1);
			memcpy(&retval[0], &(r->integer), sizeof(double));
			retval.attr("class") = wrap("integer64");
			return retval;
		}
		else {
			int retval = r->integer;
			return wrap(retval);
		}
	}
	case REDIS_REPLY_NIL: {
		return R_NilValue;
	}
	case REDIS_REPLY_ARRAY: {
		List retval;
		extract_array(r, retval);
		return retval;
	}
	default:
		throw std::logic_error("Unknown type");
	}
}
