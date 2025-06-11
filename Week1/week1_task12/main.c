#include <stdint.h>

int main() {
    volatile uint32_t counter = 0;
    while (1) {
        counter++;
        if (counter > 100000) break;
    }
    return 0;
}
