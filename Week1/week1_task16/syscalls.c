#include <stdint.h>

#define UART_TX_ADDR 0x10000000

int _write(int fd, const char *buf, int len) {
    volatile char *uart = (char *)UART_TX_ADDR;
    for (int i = 0; i < len; i++) {
        uart[0] = buf[i];
    }
    return len;
}
