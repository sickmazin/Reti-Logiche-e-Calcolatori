%include "utils.nasm"

section .data
    v dw -2,3,7,6,2,-10,-3,5
    n equ ($-v)/2
section .bss
    ris resw 1
section .text
global _start
extern getMax_proc
_start:
    push ris
    push dword n
    push v
    call getMax_proc
    printw word [ris]
    exit 0