// -*- compile-command: "g++ -o writeC++ writeC++.cpp -lhiredis"; -*-*

#include <hiredis/hiredis.h>        // we check in configure for this
#include <iostream>
#include <cstdlib>
#include <vector>

int main(void) {

    redisContext *prc;              // pointer to redis context

    std::string host="127.0.0.1";
    int port=6379;

    prc = redisConnect(host.c_str(), port);
    if (prc->err) {
        std::cerr << "Redis connection error: " << prc->errstr << std::endl;
        exit(-1);
    }

    double score = 1.0;         	// initial 'score' 
    std::vector<double> vec(2); 	// as an example: pos 0 will be 'score', pos 1 'value' 
    vec[0] = score;
    vec[1] = 100.0;

    int n = 10;
    for (int i=0; i<n; i++) {

        printf("ZADD ex:bin:test %17.6f (%f,%f) -- ", score, vec[0], vec[1]);
        
        redisReply *reply = (redisReply*) redisCommand(prc, 
                                                       "ZADD ex:bin:test %f %b", 
                                                       score,
                                                       vec.begin(), 
                                                       (size_t) vec.size()*sizeof(double));
        if (reply->type == REDIS_REPLY_STRING) {
            std::cout << " REPLY STRING: " << reply->str << std::endl;
        }
        if (reply->type == REDIS_REPLY_STATUS) {
            std::cout << " REPLY STATUS: " << reply->str << std::endl;
        }
        if (reply->type == REDIS_REPLY_ERROR) {
            std::cout << " REPLY ERROR: " << reply->str << std::endl;
        }
        if (reply->type == REDIS_REPLY_INTEGER) {
            std::cout << " REPLY INT: " << reply->integer << std::endl;
        }
        if (reply->type == REDIS_REPLY_NIL) {
            std::cout << " REPLY NIL" << std::endl;
        }
        freeReplyObject(reply);

        score += 1.0;
        vec[0] = score;
        vec[1] *= 1.001;
    }
    exit(0);
}
