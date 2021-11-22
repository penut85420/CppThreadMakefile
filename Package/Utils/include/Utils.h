#ifndef _PKG_UTILS_UTILS_H_
#define _PKG_UTILS_UTILS_H_

#include <chrono>
#include <cstdio>
#include <thread>

#if defined(_DEBUG)
#define DPRINT(...) fprintf(stderr, __VA_ARGS__)
#else
#define DPRINT(...)
#endif

void Sleep(int);

#endif  // _PKG_UTILS_UTILS_H_
