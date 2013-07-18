#include "Rhiredis.hpp"
using namespace Rcpp;

//'@title %%summary%%
//'@export
//[[Rcpp::export]]
SEXP redis%%name%%(%%args-argv%%, SEXP Rc) {
	BEGIN_RCPP
	
	redisContext* c(extract_ptr<RredisContext>(Rc)->get_ptr());
	redisReply* r = (redisReply*) redisCommand(c, "%%name%% %%args-cmd%%", %%args-value%%);
	if (r == NULL) {
		throw std::runtime_error(std::string(c->errstr));
	}
	END_RCPP
}
