%include "utils.nasm"

section .data
    V equ 8
    n equ 12
    ris equ 16
section .text
global traccia110215proc
traccia110215proc:
    push ebp
    mov ebp,esp
    pushad

    mov eax,[ebp+V] ;eax indirizzo di V
    sub [ebp+n], word 1

    xor di,di
    xor cx,cx
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine
    mov bx,[eax+esi*2] ; ax = v[i]
    inc esi
    mov dx,[eax+esi*2] ; dx = v[i+1]
    cmp bx,dx  ; v[i] >= v[i+1]
    jg comparaCX
    inc cx
    jmp ciclo
comparaCX:
    cmp cx,di
    jg CXmaggiore
    jmp ciclo
CXmaggiore:
    mov di,cx
    jmp ciclo
fine:
    mov [ebp+ris],di
    popad
    pop ebp
    ret 12
