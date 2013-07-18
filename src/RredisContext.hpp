#ifndef __RREDISCONTEXT_HPP__
#define __RREDISCONTEXT_HPP__

#include "hiredis/hiredis.h"
#include <string>
#include <boost/shared_ptr.hpp>

typedef boost::shared_ptr<redisContext> predisContext;

class RredisContext {
	predisContext c;
public:
	RredisContext(redisContext *c_src);
	~RredisContext();
	
	redisContext* get_ptr();
	int get_err();
	std::string get_errstr();
  int get_fd();
	int get_flags();
	
};

#endif //__RREDISCONTEXT_HPP__