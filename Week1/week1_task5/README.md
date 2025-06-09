# 📈 Week 1 - Task 5: ABI & Register Cheat-Sheet

## 💡 Objective

Create a comprehensive **cheat sheet** documenting the 32 integer registers of the **RV32** architecture, their **ABI names**, and their typical **roles in the calling convention**.

---

## 🔹 RV32 Integer Registers Cheat Sheet

| Register | ABI Name | Usage                                         |
| -------- | -------- | --------------------------------------------- |
| x0       | zero     | Constant zero                                 |
| x1       | ra       | Return address                                |
| x2       | sp       | Stack pointer                                 |
| x3       | gp       | Global pointer                                |
| x4       | tp       | Thread pointer                                |
| x5       | t0       | Temporary (caller-saved)                      |
| x6       | t1       | Temporary (caller-saved)                      |
| x7       | t2       | Temporary (caller-saved)                      |
| x8       | s0 / fp  | Saved register / frame pointer (callee-saved) |
| x9       | s1       | Saved register (callee-saved)                 |
| x10      | a0       | Function argument 0 / Return value 0          |
| x11      | a1       | Function argument 1 / Return value 1          |
| x12      | a2       | Function argument 2                           |
| x13      | a3       | Function argument 3                           |
| x14      | a4       | Function argument 4                           |
| x15      | a5       | Function argument 5                           |
| x16      | a6       | Function argument 6                           |
| x17      | a7       | Function argument 7                           |
| x18      | s2       | Saved register (callee-saved)                 |
| x19      | s3       | Saved register (callee-saved)                 |
| x20      | s4       | Saved register (callee-saved)                 |
| x21      | s5       | Saved register (callee-saved)                 |
| x22      | s6       | Saved register (callee-saved)                 |
| x23      | s7       | Saved register (callee-saved)                 |
| x24      | s8       | Saved register (callee-saved)                 |
| x25      | s9       | Saved register (callee-saved)                 |
| x26      | s10      | Saved register (callee-saved)                 |
| x27      | s11      | Saved register (callee-saved)                 |
| x28      | t3       | Temporary (caller-saved)                      |
| x29      | t4       | Temporary (caller-saved)                      |
| x30      | t5       | Temporary (caller-saved)                      |
| x31      | t6       | Temporary (caller-saved)                      |

---

## 📝 Calling Convention Summary

### 🔀 a0-a7 (x10-x17) - Function Arguments and Return Values

* Registers used to pass arguments to functions.
* Also used to return values from functions.

### 🔀 s0-s11 (x8-x9, x18-x27) - Saved Registers (Callee-Saved)

* These must be preserved across function calls.
* If a function uses them, it must save and restore them.

### 🔀 t0-t6 (x5-x7, x28-x31) - Temporary Registers (Caller-Saved)

* May be overwritten by called functions.
* Caller should save them if needed.

### 🔀 ra (x1) - Return Address

* Holds the address to return to after a function call.

### 🔀 sp (x2) - Stack Pointer

* Points to the current top of the stack.

### 🔀 gp (x3), tp (x4)

* gp: Global pointer.
* tp: Thread pointer.

### 🔀 zero (x0)

* Always holds constant **0**.

---

## 🔄 Summary

* This cheat sheet will help in **assembly analysis** and understanding how C functions map to assembly.
* Very useful when reading disassembled code or writing **RISC-V assembly manually**.
* Knowing which registers are preserved vs clobbered is critical when writing efficient and correct code.

---



