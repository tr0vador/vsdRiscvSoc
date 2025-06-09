
# VSD RISC-V SoC Project

## Overview

This repository contains the ongoing work for the VLSI System Design (VSD) RISC-V SoC project. The goal is to design, tape out, and validate a fully indigenous RISC-V SoC using industry-grade tools and SCL 180nm PDK.

---

## Week 1, Task 1: Install & Sanity-Check the Toolchain

### Objective

Set up the RISC-V toolchain on Linux Mint and verify its functionality.

### Prerequisites

- Linux Mint or Ubuntu-based Linux distribution
- Downloaded `riscv-toolchain-rv32imac-x86_64-ubuntu.tar.gz`

### Setup Steps

1. Extract the toolchain archive:

   ```bash
   tar -xzf ~/Downloads/riscv-toolchain-rv32imac-x86_64-ubuntu.tar.gz -C ~/opt/
   ```

2. Add the toolchain binaries to your PATH by appending this line to `~/.bashrc`:

   ```bash
   export PATH=$HOME/opt/riscv/bin:$PATH
   ```

3. Reload your shell environment:

   ```bash
   source ~/.bashrc
   ```

4. Verify the installation by running:

   ```bash
   riscv32-unknown-elf-gcc --version
   riscv32-unknown-elf-objdump --version
   riscv32-unknown-elf-gdb --version
   ```

5. Fix missing shared library errors (if any) by installing the required dependencies (e.g., Python libraries).

---

### Verification Screenshot

![Toolchain Verification Screenshot](screenshots/Screenshot%20from%202025-06-09%2009-37-07.png)

---

### Notes

- The screenshot shows successful verification of the RISC-V toolchain.
- The toolchain binaries are located in `$HOME/opt/riscv/bin`.
- If you face issues with `gdb` due to missing Python libraries, install the necessary versions using your package manager.

---

### Next Steps

- Continue with further tasks as per the workshop.
- Document your progress similarly in this README.

---

*Created by Thanmay U*
