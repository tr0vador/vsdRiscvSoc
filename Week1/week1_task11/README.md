
# 📦 Task 11: Linker Script 101

## 🎯 Objective
Create a minimal linker script that places `.text` at `0x00000000` (typically Flash) and `.data` at `0x10000000` (typically SRAM) for an RV32IMC bare-metal program.

---

## 🧾 Minimal Linker Script

```ld
ENTRY(_start)

SECTIONS {
    .text 0x00000000 : {
        *(.text)
        *(.text.*)
    }

    .data 0x10000000 : {
        *(.data)
        *(.data.*)
    }
}
```

- ✅ `.text` section: Contains the program code. Placed at address `0x00000000` (usually Flash memory).
- ✅ `.data` section: Contains initialized global/static variables. Placed at `0x10000000` (usually SRAM).

---

## 🧠 Why This Memory Layout?

| Section  | Address Range    | Memory Type | Purpose                          |
|----------|------------------|-------------|----------------------------------|
| `.text`  | 0x00000000       | Flash       | Stores executable instructions   |
| `.data`  | 0x10000000       | SRAM        | Stores modifiable global data    |

### 🔍 Flash (Non-Volatile Memory)
- Read-only during runtime.
- Ideal for storing instructions and constants.
- Retains data after reset or power-off.

### 🔄 SRAM (Volatile Memory)
- Read/Write capable memory.
- Used for `.data` and `.bss` sections.
- Loses data on power-off.

---

## 🚀 Runtime Behavior
- At boot, CPU begins execution from the `.text` section in Flash.
- Startup code (usually in `start.S`) copies `.data` from Flash to SRAM.
- This ensures that global variables are initialized properly in writable memory.

---

## 📸 Screenshots?

❌ **No screenshots are needed** for this task unless you want to show:
- The layout of your ELF file using `riscv32-unknown-elf-objdump -h prog.elf`
- Or verify section placement using `readelf -S prog.elf`

But for most documentation purposes, this task does **not require screenshots**.

---

✅ **Task Complete When:**
- Linker script is syntactically correct.
- `.text` and `.data` are placed at required memory locations.
- Program compiles and runs using this layout.

