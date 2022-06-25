%include "utils.nasm"

section .data
    V dw 2,-3,4,5,-8,1,11
    n equ ($-V)/2
section .bss
    ris resw 1
section .text
global _start
extern traccia190121proc
_start:
    push ris
    push dword n
    push V
    call traccia190121proc
    printw word [ris]
    exit 0
    