#include "Looping.h"

Looping::Looping() {
    DPRINT("Create\n");
    lock = new int(1);
}

Looping::~Looping() {
    DPRINT("Delete\n");
    delete lock;
}

void Looping::operator()(int n) {
    DPRINT("[BEG] Lock: %d, Arg: %d\n", *lock, n);
    while (*lock) {
        DPRINT("[GGG] Lock: %d, Arg: %d\n", *lock, n);
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    DPRINT("[END] Lock: %d, Arg: %d\n", *lock, n);
}

void Looping::stop() { *lock = 0; }
