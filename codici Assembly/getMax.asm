%include "utils.nasm"

section .data
    V dw -2,3,7,6,2,-10,-3,5
    n equ ($-V)/2

section .bss
    max resw 1

section .text
global _start
extern getMax_proc
_start:
    sub esp,2
    push V
    push dword n
    call getMax_proc
    printw word [max]
    exit 0