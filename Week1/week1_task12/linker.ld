ENTRY(_start)

MEMORY {
    FLASH : ORIGIN = 0x00000000, LENGTH = 1M
    RAM   : ORIGIN = 0x10000000, LENGTH = 1M
}

SECTIONS {
    .text : {
        *(.text*)
    } > FLASH

    .bss : {
        __bss_start = .;
        *(.bss*)
        __bss_end = .;
    } > RAM
}
