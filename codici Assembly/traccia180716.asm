; traccia 18/07/2016
%include "utils.nasm"

section .data
    V dw 2,6,9,4,10,9,1,2,4,11
    W dw 8,3,6,5,8,5,3,2,10,2
    n equ ($-W)/2
section .bss
    T resw  n*2
section .text
global _start
extern traccia180716proc
_start:
    
    push T
    push dword n
    push W
    push V
    call traccia180716proc
    xor esi,esi
ciclo:
    cmp esi, n*2
    jge fine
    printw word [T+esi*2]
    inc esi
    jmp ciclo
fine:
    exit 0