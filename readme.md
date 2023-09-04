# Little os


## Intro

I am trying to write a little Operation System in Assembly x86 and C language.

For now I'm writing the bootloader yet.

This version is using the DOS bios mode, which is 16 bits architecture.


## Prerequisites

* [nasm](https://www.nasm.us/)
* [qemu](https://www.qemu.org/)


## How to build it


nasm -f bin file.asm -o file.bin


## How to run it


qemu-system-x86_64 file.bin



===

Some suggestions ? Please, let me know ;-)

Bye !

#### ======= References:

[Daedalus Community](https://youtube.com/playlist?list=PLm3B56ql_akNcvH8vvJRYOc7TbYhRs19M&si=1o62umV5LCkNhu_d)

[BIOS - Interrupt Table](https://en.wikipedia.org/wiki/BIOS_interrupt_call)
