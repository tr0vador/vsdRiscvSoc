volatile char *uart = (char *)0x10000000;

void main() {
    const char *msg = "Hello, RISC-V!\n";
    while (*msg) {
        *uart = *msg++;
    }
    while (1);
}

