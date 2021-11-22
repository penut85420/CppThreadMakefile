#include "Utils.h"

void Sleep(int n) {
    std::this_thread::sleep_for(std::chrono::seconds(1));
}
