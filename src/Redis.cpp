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
#include <hiredis/hiredis.h>         // on Ubuntu file /usr/include/hiredis/hiredis.h

// A simple and lightweight class -- with just a simple private member variable 
// We could add some more member variables to cache the last call, status, ...
//
using namespace Rcpp; 

class Redis {

private: 
   
    redisContext *prc_;                // private pointer to redis context

    void init(std::string host="127.0.0.1", int port=6379)  { 
        prc_ = redisConnect(host.c_str(), port);
        // should test for error here...
        Rcpp::Rcout << "Init'ed\n";
    }
	
public:
	  
    SEXP extract_reply(redisReply *reply){
        switch(reply->type) {
        case REDIS_REPLY_STRING:
        case REDIS_REPLY_STATUS: {
            std::string res(reply->str);
            return(wrap(res));
        }
        case REDIS_REPLY_INTEGER: {
            return(wrap((double)reply->integer));
        }
        case REDIS_REPLY_ERROR: {
            std::string res(reply->str);
            return(wrap(res));
        }
        case REDIS_REPLY_NIL: {
            return(R_NilValue);
        }
        case REDIS_REPLY_ARRAY: {
            Rcpp::GenericVector retval(reply->elements);
            extract_array(reply, retval);
            return(retval);
        }
        default:
            throw std::logic_error("Unknown type");
        }
    }
		
    void extract_array(redisReply *node, Rcpp::List& retval) {
        for(unsigned int i = 0;i < node->elements;i++) {
            retval[i] = extract_reply(node->element[i]);
        }
    }
    
    Redis(std::string host, int port)  { init(host, port); }
    Redis(std::string host)            { init(host);       }
    Redis()                            { init();           }
		
    ~Redis() { 
        redisFree(prc_);
        prc_ = NULL;                // just to be on the safe side
        //Rcpp::Rcout << "Deleted\n";
    }

    SEXP exec(std::string cmd) {
        redisReply *reply = static_cast<redisReply*>(redisCommand(prc_, cmd.c_str()));
        SEXP rep = extract_reply(reply);
        freeReplyObject(reply);
        return(rep);
    }

    // could create new functions to (re-)connect with given host and port etc pp
};


RCPP_MODULE(Redis) {
    Rcpp::class_<Redis>("Redis")   
        
        .constructor("default constructor")  
        .constructor<std::string>("constructor with host port")  
        .constructor<std::string, int>("constructor with host and port")  

        .method("exec", &Redis::exec,  "execute given redis command")
    ;
}
