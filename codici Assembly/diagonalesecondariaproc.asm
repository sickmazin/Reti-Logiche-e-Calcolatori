%include "utils.nasm"

section .data
    V equ 8
    n equ 12
    somma equ 16
section .text
global diagonalesecondariaproc
diagonalesecondariaproc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]  ;indirizzo di V
    mov edi,[ebp+n]
    mov ecx,[ebp+somma]
    
    imul edi,2
    mov ebx,edi
    
    mov esi,[ebp+n]
    dec esi
    xor eax,eax
ciclo: 
    cmp esi,0
    jl fine
    add ax,[edx+esi*2]
    add edx,ebx
    dec esi
    jmp ciclo
fine:
    mov [ecx],ax
    popad
    mov esp,ebp
    pop ebp
    ret 12