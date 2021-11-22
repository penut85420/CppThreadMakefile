#ifndef _PKG_THREAD_CLASS_LOOPING_H_
#define _PKG_THREAD_CLASS_LOOPING_H_

#include "Utils.h"
#include <chrono>
#include <cstdio>
#include <thread>

class Looping {
   public:
    Looping();
    ~Looping();
    void operator()(int);
    void stop();

   private:
    int *lock = NULL;
};

#endif  // _PKG_THREAD_CLASS_LOOPING_H_
