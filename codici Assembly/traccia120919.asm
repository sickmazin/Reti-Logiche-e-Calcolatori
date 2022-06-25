%include "utils.nasm"

section .data
    v dw 1,19,19,3,13,2,12,25
    nv equ ($-v)/2
    w dw 18,12,3
    nw equ ($-w)/2
section .text
global _start
extern traccia120919proc
_start:
    push dword nw
    push w
    push dword nv
    push v
    call traccia120919proc
    xor esi,esi
ciclo:
    cmp esi,nv
    jge fine
    printw word [v+esi*2]
    inc esi
    jmp ciclo
fine:
    exit 0