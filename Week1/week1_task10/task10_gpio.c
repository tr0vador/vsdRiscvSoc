#include <stdint.h>

#define GPIO_ADDR 0x10012000

void toggle_gpio(void) {
    volatile uint32_t *gpio = (volatile uint32_t *)GPIO_ADDR;
    *gpio = 0x1;
    uint32_t current_state = *gpio;
    *gpio = ~current_state;
    *gpio |= (1 << 0);
    *gpio &= ~(1 << 1);
}

void gpio_operations(void) {
    volatile uint32_t *gpio = (volatile uint32_t *)GPIO_ADDR;
    *gpio = 0x0;
    *gpio = 0x1;
    *gpio = 0xFFFFFFFF;
    *gpio = 0x0;
}

int main() {
    toggle_gpio();
    gpio_operations();
    while (1) {
        static volatile int counter = 0;
        counter++;
        if (counter > 1000000) break;
    }
    return 0;
}
