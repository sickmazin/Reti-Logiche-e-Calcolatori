%include "utils.nasm"

section .data
    V dw  -1,-2,4,6,4,4,2,8,1,2,7
    n equ ($-V)/2
    k dw 4
section .bss
    ris resw 1
section .text
global _start
extern traccia28_1_2016_proc
_start:
    push ris
    push dword n
    push dword [k]
    push V
    call traccia28_1_2016_proc
    printd dword [ris]
    exit 0