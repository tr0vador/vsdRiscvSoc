#include <stdint.h>

#define UART_BASE 0x10000000

static inline uint32_t rdcycle(void) {
    uint32_t c;
    asm volatile ("csrr %0, 0xC00" : "=r"(c));
    return c;
}

void uart_putc(char c) {
    volatile uint8_t *uart = (volatile uint8_t *)UART_BASE;
    *uart = c;
}

void uart_puts(const char *str) {
    while (*str) {
        uart_putc(*str++);
    }
}

void uart_puthex(uint32_t value) {
    char hex[] = "0123456789ABCDEF";
    uart_puts("0x");
    for (int i = 28; i >= 0; i -= 4) {
        uart_putc(hex[(value >> i) & 0xF]);
    }
}

int main(void) {
    uart_puts("Testing cycle counter...\n");
    uint32_t val = rdcycle();
    uart_puts("Cycle value: ");
    uart_puthex(val);
    uart_putc('\n');
    return 0;
}
