%include "utils.nasm"

section .data
    V equ 8
    n equ 12
    ris equ 16
section .text
global checkSum_proc
checkSum_proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]
    
    xor edi,edi
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine0
    mov ax,[edx+esi*2]
    xor edi,edi
    xor ebx,ebx
sommaprec:
    cmp edi,esi
    jge confronta
    add bx,[edx+edi*2]
    inc edi
    jmp sommaprec
confronta:
    cmp ax,bx
    je fine1
    inc esi
    jmp ciclo
fine0:
    xor ax,ax
    jmp fine
fine1:
    mov ax,word 1
fine:
    mov ebx,[ebp+ris]
    mov [ebx],ax
    popad
    mov esp,ebp
    pop ebp
    ret 12

