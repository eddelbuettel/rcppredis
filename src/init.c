#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP _rcpp_module_boot_Redis();
extern SEXP _OPEN_FD();
extern SEXP _SOCK_NAGLE(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"_rcpp_module_boot_Redis", (DL_FUNC) &_rcpp_module_boot_Redis, 0},
    {"_OPEN_FD",    (DL_FUNC) &_OPEN_FD,    0},
    {"_SOCK_NAGLE", (DL_FUNC) &_SOCK_NAGLE, 2},
    {NULL, NULL, 0}
};

void R_init_RcppRedis(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
