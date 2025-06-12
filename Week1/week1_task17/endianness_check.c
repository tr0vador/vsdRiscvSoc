#include <stdio.h>
#include <stdint.h>

int main() {
    union {
        uint32_t word;
        uint8_t bytes[4];
    } test;

    test.word = 0x01020304;

    printf("Stored word: 0x%08X\n", test.word);
    printf("Byte order: %02X %02X %02X %02X\n",
           test.bytes[0], test.bytes[1], test.bytes[2], test.bytes[3]);

    return 0;
}
