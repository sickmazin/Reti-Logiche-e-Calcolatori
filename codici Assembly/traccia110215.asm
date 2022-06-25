%include "utils.nasm"

section .data
    V dw 13, 8, -1, 4, 2, 7, 11
    n equ ($-V)/2
section .bss
    ris resw 1
section .text
global _start
extern traccia110215proc
_start:
    push ris
    push dword n
    push V
    call traccia110215proc
    printw word [ris]
    exit 0