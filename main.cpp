#include <thread>

#include "Looping.h"
#include "Utils.h"

int main() {
#ifndef _DEBUG
    fprintf(stderr, "_DEBUG is not defined.\n");
#endif
    DPRINT("Creating Looping\n");
    Looping l;

    DPRINT("Creating Thread\n");
    std::thread th(&Looping::operator(), &l, 10);

    DPRINT("Begin Sleeping\n");
    Sleep(1);

    DPRINT("Stop!\n");
    l.stop();

    DPRINT("Wait For Join\n");
    th.join();

    return 0;
}
