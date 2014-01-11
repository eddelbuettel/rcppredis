// -*- indent-tabs-mode: nil; tab-width: 4; c-indent-level: 4; c-basic-offset: 4; -*-
//
// simple C++ class to host a stateful connection to redis
//
// uses hiredis library which provides a basic C API to redis
//
// (for now) forked from Wush Wu's Rhiredis
// slowly adding some more Redis functions
//
// Dirk Eddelbuettel, 2013 - 2014

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
        if (prc_->err) 
            Rcpp::stop(std::string("Redis connection error: ") + std::string(prc_->errstr));
    }
	
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

public:
   
    Redis(std::string host, int port)  { init(host, port); }
    Redis(std::string host)            { init(host);       }
    Redis()                            { init();           }

    ~Redis() { 
        redisFree(prc_);
        prc_ = NULL;                // just to be on the safe side
    }

    // execute given string
    SEXP exec(std::string cmd) {
        redisReply *reply = static_cast<redisReply*>(redisCommand(prc_, cmd.c_str()));
        SEXP rep = extract_reply(reply);
        freeReplyObject(reply);
        return(rep);
    }


    // redis set
    std::string set(std::string key, Rcpp::RawVector x) {
        // uses binary protocol, see hiredis doc at github
        redisReply *reply = 
            static_cast<redisReply*>(redisCommand(prc_, "SET %s %b", 
                                                  key.c_str(), x.begin(), x.size()));
        std::string res(reply->str);                                                
        freeReplyObject(reply);
        return(res);
    }

    // could create new functions to (re-)connect with given host and port etc pp


};


RCPP_MODULE(Redis) {
    Rcpp::class_<Redis>("Redis")   
        
        .constructor("default constructor")  
        .constructor<std::string>("constructor with host port")  
        .constructor<std::string, int>("constructor with host and port")  

        .method("exec", &Redis::exec,  "execute given redis command")

        .method("set", &Redis::set,  "runs 'SET key rawVector'")
    ;
}
