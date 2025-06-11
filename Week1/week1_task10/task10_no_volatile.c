#include <stdint.h>
#define GPIO_ADDR 0x10012000

void toggle_gpio_no_volatile(void) {
    uint32_t *gpio = (uint32_t *)GPIO_ADDR;
    *gpio = 0x1;
    *gpio = 0x0;
    *gpio = 0x1; // Might get optimized out
}

int main() {
    toggle_gpio_no_volatile();
    return 0;
}
