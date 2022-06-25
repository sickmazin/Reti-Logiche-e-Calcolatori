%include "utils.nasm" 

section .data:
    str db 'ciao' \n
    n equ $-str
section .text:
global _start
_start:
    xor esi,esi ; equivalente a mov esi,0   i=0
    mov edi,n-1   ; j=n-1
ciclo:
    cmp esi,edi
    jge fine
    lea ebx,[str+esi]
    lea ecx,[str+esi]
    mov al , [ebx]
    xchg al, [ecx]
    mov [ebx],al
    inc esi
    dec edi
    jmp ciclo
fine:
    exit 0