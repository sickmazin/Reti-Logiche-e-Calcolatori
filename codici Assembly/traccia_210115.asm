%include "utils.nasm"

section .data:
    V dw 3, 4, 3, 2, 1
    n equ ($-V)/2

section .bss:
    c resw 1

section .text:
global _start
extern proc
_start:
    push c
    push V 
    push dword n 
    call proc
    printw word [c]
    exit 0