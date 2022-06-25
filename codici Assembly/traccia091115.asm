%include "utils.nasm"

section .data
    V dw 7,1,0,2,8,6,9,3,5,4
    n equ ($-V)/2

section .bss
    W resw n

section .text
global _start
extern traccia0911proc
_start:
    push W
    push dword n
    push V
    call traccia0911proc
    xor esi,esi
ciclo_stamp: 
    cmp esi,10
    jge fine
    printw word [W+esi*2]
    inc esi
    jmp ciclo_stamp
fine: exit 0
