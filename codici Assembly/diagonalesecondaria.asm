%include "utils.nasm"

section .data
    V dw 0,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0
    n equ ($-V)/8
section .bss
    somma resw 1
section .text
global _start
extern diagonalesecondariaproc
_start:
    push somma
    push dword n
    push V
    call diagonalesecondariaproc
    printw word [somma]
    exit 0