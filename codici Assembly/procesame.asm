%include "utils.nasm"

section .data
    v equ 8
    n equ 12 
    h equ 16
    w equ 18
section .text
global procesame
procesame:
    push ebp
    mov ebp,esp
    pushad

    mov ebx,[ebp+v]
    mov ecx,[ebp+w]

    xor di,di
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fineciclo
    mov ax,[ebx+esi*2]
    idiv word  [ebp+h]
    cmp di,dx
    je uguale 
    inc esi
    jmp ciclo
uguale:
    add [ecx],word 1
    inc esi
    jmp ciclo
fineciclo:
    cmp di,[ebp+h]
    jge fine
    xor esi,esi
    add ecx,2
    inc di
    jmp ciclo
fine:
    popad
    mov esp,ebp
    pop ebp
    ret 14