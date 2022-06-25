%include "utils.nasm"

; getfreq(V,n, elemento,&ret)
section .data:
    ris equ 20
    V equ 16
    n equ 12
    elem equ 8

section.text:
global get_freq
get_freq:
    push ebp
    mov ebp,esp
    pushad

    mov edx, [ebp+V]
    mov ebx, [ebp+elem]

    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jle fine
    mov eax,
    cmp ecx,ebx
    jne avanti
    inc edi
avanti:
    add eax,4
    dec esi
    jmp ciclo
fine:
    mov eax,[ebp+ris]
    mov [eax],edi
    popad
    pop ebp
    ret 16