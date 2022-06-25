%include "utils.nasm"

section .data
    V dw -2,5,1,3,-1,1,-6
    n equ ($-V)/2

section .bss
    cont resd 1

section .text
global _start
extern trac22_06_21_proc
_start:
    push cont
    push dword n
    push V
    call trac22_06_21_proc
    xor esi,esi
ciclo:
    cmp esi,n
    jge fine
    printw word [V+esi*2]
    inc esi
    jmp ciclo
fine:
    printd dword [cont]
    exit 0