%include "utils.nasm"

section .data
    V dd  11,2,3,8,11,5,11,3,2,1,11
    n equ($-V)/4
section .bss
    moda resd 1
section .text
global _start
extern moda_proc
_start:
    push moda 
    push dword n
    push V
    call moda_proc
    printd dword [moda]
    exit 0