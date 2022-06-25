%include "utils.nasm"

section .data:
    V dw 2,-10,13,5,0,1,-9,3
    n equ ($-V)/2
    d dw 7
section .bss:
    ris resw 1
section .text:
global _start
extern traccia16_07_20_proc
_start:
    push V
    push n
    push d
    push ris
    call traccia16_07_20_proc
    printw word [ris]
    exit 0