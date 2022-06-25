%include "utils.nasm"

section .data
    V dd 1,2,3,4,5
    W dw 5,-4,-3,-2,1
    n equ ($-W)/2
section .bss
    pos resw 1
section .text
global _start
extern traccia100415proc
_start:
    push pos
    push dword n
    push W
    push V
    call traccia100415proc
    printw word [pos]
    exit 0