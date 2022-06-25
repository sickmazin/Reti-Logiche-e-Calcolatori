%include "utils.nasm"

section .data
    V dw -2 , 5 , 1 , 3 , -1 , 1 , -6
    n equ ($-V)/2
section .bss
    c resw 1
section .text
global _start
extern traccia220621proc
_start:
    push c
    push dword n
    push V
    call traccia220621proc
    printw word [c]
    exit 0


