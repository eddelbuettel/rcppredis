#include "RcppModule.hpp"

RCPP_MODULE(hiredis) {
	class_<RredisContext>("redisContext")
	.property("err", &RredisContext::get_err)
	.property("errstr", &RredisContext::get_errstr)
	.property("fd", &RredisContext::get_fd)
	.property("flags", &RredisContext::get_flags)
	;
}
