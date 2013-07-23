// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; -*-
//
// simple C++ class to host a stateful connection to redis
//
// uses hiredis library which provides a basic C API to redis
//
// (for now) forked from Wush Wu's Rhiredis
//
// Dirk Eddelbuettel, July 2013

#include <Rcpp.h>
#include <hiredis/hiredis.h> 	// on Ubuntu file /usr/include/hiredis/hiredis.h

// We use a static pointer which makes the variable persistent across calls
// A more formal C++ idiom would be a singleton class, but this is simpler
static redisContext *prc = NULL;


// A simple and lightweight class -- without member variables 
// We could add some member variables to cache the last call, status, ...
//
class Redis {

private: 
    void checkAndInit() {
	if (prc == NULL) {
	    prc = redisConnect("127.0.0.1", 6379);
	    // should test for error here, could even throw() under Rcpp, ...
	    Rcpp::Rcout << "Context created\n";
	} else {
	    Rcpp::Rcout << "Reusing context\n";
	}
    }

public:
    Redis()  { /* Rcpp::Rcout << "In ctor\n"; */ }
    ~Redis() { /* Rcpp::Rcout << "In dtor\n"; */ }

    std::string execCommand(std::string cmd) {
	checkAndInit();		// important: ensure prc is set up, re-use if so
	redisReply *reply = static_cast<redisReply*>(redisCommand(prc, cmd.c_str()));
	std::string res(reply->str);
	freeReplyObject(reply);
	return(res);
    }

    void disconnect() {
	redisFree(prc);
	prc = NULL;		// just to be on the safe side
    }

    // could create new functions to (re-)connect with given host and port etc pp
};


// for now, single worker function
extern "C" SEXP execRedisCommand(SEXP p) {
    Redis redis;
    std::string txt = Rcpp::as<std::string>(p);
    std::string res = redis.execCommand(txt);
    return Rcpp::wrap(res);
}
