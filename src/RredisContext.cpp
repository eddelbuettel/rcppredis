#include "RredisContext.hpp"

RredisContext::RredisContext(redisContext* c_src) 
: c(c_src, std::ptr_fun<redisContext*, void>(&redisFree)) { }

RredisContext::~RredisContext() { }

redisContext* RredisContext::get_ptr() { return &(*c); }

int RredisContext::get_err() {
	return c->err;
}

std::string RredisContext::get_errstr() {
	return std::string(c->errstr, 128);
}

int RredisContext::get_fd() {
	return c->fd;
}

int RredisContext::get_flags() {
	return c->flags;
}
