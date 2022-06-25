%include "utils.nasm"

section .data
    V equ 8
    W equ 12
    n equ 16
    T equ 20
section .text
global traccia180716proc
traccia180716proc:
    push ebp 
    mov ebp,esp
    pushad
    
    mov edx,[ebp+V]
    mov ecx,[ebp+W]

    mov edi,[ebp+n]
    imul edi,2
    mov [ebp+n],edi
    mov ebx,[ebp+T]

    xor esi,esi
ciclo:  
    cmp esi,[ebp+n]
    jg fine
    mov ax,[edx+esi*2]
    and ax,1
    jnz dispari
    mov ax,[ecx+esi*2]
    and ax,1
    jnz dispari
    jmp pari
dispari:
    mov ax,[edx+esi*2]
    neg ax
    mov [ebx+esi*2],ax
    mov ax,[ecx+esi*2]
    neg ax
    mov [ebx+esi*2+2],ax
    inc esi
    jmp ciclo
pari:
    mov ax,[edx+esi*2]
    mov [ebx+esi*2],ax
    mov ax,[ecx+esi*2]
    mov [ebx+esi*2+2],ax
    inc esi
    jmp ciclo
fine:
    popad
    pop ebp
    ret 16
