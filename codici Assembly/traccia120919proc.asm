%include "utils.nasm"

section .data
    v equ 8
    nv equ 12
    w equ 16
    nw equ 20
section .text
global traccia120919proc
traccia120919proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+v]
    mov ecx,[ebp+w]

    xor esi,esi
    xor edi,edi
ciclo:
    cmp esi,[ebp+nv]
    jge fine
    mov ax,[edx+esi*2]  ; ax = v[i]
    cmp edi,[ebp+nw]
    je azzera
    jmp modifica
azzera:
    xor edi,edi
modifica:
    add ax,[ecx+edi*2] ; ax= ax + w[i]
    mov [edx+esi*2],ax
    inc esi
    inc edi
    jmp ciclo
fine:
    popad
    mov esp,ebp
    pop ebp
    ret 16