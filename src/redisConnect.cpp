#include <Rcpp.h>
#include "hiredis/hiredis.h"
#include "util.hpp"
#include "RredisContext.hpp"
#include "RcppModule.hpp"

using namespace Rcpp;

//'@export
//[[Rcpp::export]]
SEXP redisConnect(std::string host = "localhost", int port = 6379) {
	BEGIN_RCPP
	RredisContext retval(redisConnect(host.c_str(), port));
	if (retval.get_ptr() != NULL && retval.get_ptr()->err) {
		std::string errstr(retval.get_ptr()->errstr, 128);
		throw std::runtime_error(errstr.c_str());
	}	
	if (retval.get_ptr() == NULL) {
		throw std::runtime_error("Failed to initialize redisContext");
	}
	return wrap(retval);
	END_RCPP
}