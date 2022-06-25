%include "utils.nasm"

section .data
    v dw 6,4,7,1,9,10,7
    n equ ($-v)/2
    h equ 3 
section .bss 
    w resw h

section .text
global _start
extern procesame
_start:
    push w
    push word h
    push dword n
    push v
    call procesame
    xor esi,esi
ciclo:
    cmp esi,h
    jge fine
    printw word [w+esi*2]
    inc esi
    jmp ciclo
fine: exit 0