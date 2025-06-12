#include <stdint.h>

#define UART_TX_ADDR 0x10000000
#define UART (*(volatile uint8_t *)UART_TX_ADDR)

void uart_puts(const char *s) {
    while (*s) {
        UART = *s++;
    }
}

int main() {
    uart_puts("Hello, UART! from custom uart_puts()\n");
    while (1);
    return 0;
}

