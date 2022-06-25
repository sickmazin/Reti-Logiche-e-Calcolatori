%include "utils.nasm"

section .data
    n equ 8
    W equ 12
    V equ 16
    Z equ 20

section .data
global traccia_160914_proc
traccia_160914_proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov ebx, [ebp+W]
    mov ecx, [ebp+Z]
    mov esi, [ebp+n]
    dec esi
ciclo:
    cmp esi, 0
    jl fine
    mov edi, [eax+esi*4] ;V[i] ---> indirizzo
    mov dx, [edi]        ; Carichiamo in edi il valore dell'indirizzo V[i]
    add dx, [ebx+esi*2]  ; Sommiamo [V[i]] e W[i]
    mov [ecx+esi*2], dx  ; Carichiamo il valore in Z[i]
    dec esi
    jmp ciclo
fine:
    popad 
    pop ebp
    ret 16
