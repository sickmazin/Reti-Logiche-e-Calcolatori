%include "utils.nasm"
section .data
    A dw 2,3,1
    nA equ ($-A)/2
    B dw 3,4,-1,2
    nB equ ($-B)/2
section .bss
    res resw 1
section .text
global _start
extern traccia090915proc
_start:
    push res
    push dword nB
    push B
    push dword nA
    push A
    call traccia090915proc
    printw word [res]
    exit 0
