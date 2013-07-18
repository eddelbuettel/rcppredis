#ifndef __UTIL_HPP__
#define __UTIL_HPP__

#include <Rcpp.h>

template<class T>
T* extract_ptr(SEXP s) {
	Rcpp::S4 s4(s);
	Rcpp::Environment env(s4);
	Rcpp::XPtr<T> xptr(env.get(".pointer"));
	return static_cast<T*>(R_ExternalPtrAddr(xptr));
}

#endif // __UTIL_HPP__