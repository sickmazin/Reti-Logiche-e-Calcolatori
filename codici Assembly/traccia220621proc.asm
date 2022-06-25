%include "utils.nasm"

section .data
    V equ   8
    n equ   12
    c equ   16
section .text
global traccia220621proc
traccia220621proc:
    push ebp
    mov ebp,esp
    pushad

    mov ebx,[ebp+V]
    mov edi,[ebp+n]
    
    xor dx,dx
    xor esi,esi
ciclo:
    cmp esi,edi
    jg fine
    mov ax,[ebx+esi*2]
    mov cx,[ebx+esi*2+2]
    imul cx,4
    cmp ax,cx
    jg scambia
    inc esi 
    jmp ciclo
scambia:
    mov [ebx+esi*2],cx
    mov [ebx+esi*2+2],ax
    inc dx
    inc esi
    jmp ciclo
fine:
    mov eax,[ebp+c]
    mov [eax],dx
    popad
    mov esp,ebp
    pop ebp
    ret 12