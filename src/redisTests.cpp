
#include <hiredis/hiredis.h>         // on Ubuntu file /usr/include/hiredis/hiredis.h
#include <Rcpp.h>

// really simple test client

// [[Rcpp::export]]
std::string setRaw(std::string key, Rcpp::RawVector x) {
    redisContext *redis;
    redisReply *reply;

    redis = redisConnect("127.0.0.1", 6379);
    if (redis->err) {
        fprintf(stderr, "Connection error: %s\n", redis->errstr);
        exit(EXIT_FAILURE);
    }

    //reply = static_cast<redisReply*>(redisCommand(redis, "SET %s %s", "foo", "bar"));
    //printf("SET %s %s: %s\n", "foo", "bar", reply->str);
    //freeReplyObject(reply);

    // binary protocol, see hiredis doc at github
    reply = static_cast<redisReply*>(redisCommand(redis, "SET %s %b", 
                                                  key.c_str(), 
                                                  x.begin(), x.size()));
    //printf("SET %s (binary): %s\n", "foo", reply->str);
    std::string res(reply->str);                                                
    freeReplyObject(reply);

    return(res);
}

