// Generated by cpp11: do not edit by hand
// clang-format off


#include "cpp11/declarations.hpp"
#include <R_ext/Visibility.h>

// main.cpp
cpp11::list export_redatam_to_list_(std::string dicFilePath);
extern "C" SEXP _redatam_export_redatam_to_list_(SEXP dicFilePath) {
  BEGIN_CPP11
    return cpp11::as_sexp(export_redatam_to_list_(cpp11::as_cpp<cpp11::decay_t<std::string>>(dicFilePath)));
  END_CPP11
}

extern "C" {
static const R_CallMethodDef CallEntries[] = {
    {"_redatam_export_redatam_to_list_", (DL_FUNC) &_redatam_export_redatam_to_list_, 1},
    {NULL, NULL, 0}
};
}

extern "C" attribute_visible void R_init_redatam(DllInfo* dll){
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
  R_forceSymbols(dll, TRUE);
}