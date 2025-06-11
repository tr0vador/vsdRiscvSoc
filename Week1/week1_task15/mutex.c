#include <stdint.h>

#define UART_BASE 0x10000000
#define UART_THR (*(volatile char *)UART_BASE)

void uart_puts(const char *s) {
    while (*s) UART_THR = *s++;
}

volatile uint32_t lock = 0;

void acquire_lock(volatile uint32_t *lock) {
    uint32_t tmp;
    do {
        asm volatile (
            "lr.w %0, (%1)\n"
            "bnez %0, 1f\n"
            "li %0, 1\n"
            "sc.w %0, %0, (%1)\n"
            "1:"
            : "=&r"(tmp)
            : "r"(lock)
            : "memory"
        );
    } while (tmp != 0);
}

void release_lock(volatile uint32_t *lock) {
    *lock = 0;
}

void thread1() {
    acquire_lock(&lock);
    uart_puts("Thread 1 acquired lock\n");
    release_lock(&lock);
}

void thread2() {
    acquire_lock(&lock);
    uart_puts("Thread 2 acquired lock\n");
    release_lock(&lock);
}

int main() {
    uart_puts("Starting Mutex Test\n");
    thread1();
    thread2();
    uart_puts("Test Complete\n");

    while (1) asm volatile("wfi");
}
