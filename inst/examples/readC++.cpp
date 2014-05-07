// -*- compile-command: "g++ -o readC++ readC++.cpp -lhiredis"; -*-*

#include <hiredis/hiredis.h>        // we check in configure for this
#include <iostream>
#include <cstdlib>

int main(void) {

    redisContext *prc;              // pointer to redis context

    std::string host="127.0.0.1";
    int port=6379;

    prc = redisConnect(host.c_str(), port);
    if (prc->err) {
        std::cerr << "Redis connection error: " << prc->errstr << std::endl;
        exit(-1);
    }

    std::string cmd = "get theanswer";

    redisReply *reply = static_cast<redisReply*>(redisCommand(prc, cmd.c_str()));
    // we simplify greatly here and accomodate only one type
    if (reply->type == REDIS_REPLY_STRING) {
        std::cout << "REPLY: " << reply->str << std::endl;
    }
    freeReplyObject(reply);

    exit(0);
}
