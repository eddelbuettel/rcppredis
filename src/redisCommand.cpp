#include <Rcpp.h>
#include "hiredis/hiredis.h"
#include "util.hpp"
#include "RredisContext.hpp"
#include "RcppModule.hpp"

using namespace Rcpp;

//'@title General Redis Interface Function
//'
//'@description Perform any Redis command
//'
//'@export
//[[Rcpp::export]]
SEXP redisCommand(std::string cmd, SEXP Rc) {
	BEGIN_RCPP
	redisContext* c(extract_ptr<RredisContext>(Rc)->get_ptr());
	redisReply* r = (redisReply*) redisCommand(c, cmd.c_str());
	if (r == NULL) {
		throw std::runtime_error(std::string(c->errstr));
	}
	END_RCPP
}