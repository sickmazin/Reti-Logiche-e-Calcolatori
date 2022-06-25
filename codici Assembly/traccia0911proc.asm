%include "utils.nasm"
section .data
    V equ 8
    n equ 12
    W equ 16
section .text
global traccia0911proc
traccia0911proc:
    push ebp
    mov ebp, esp
    pushad

    mov edx,[ebp+V]
    mov ebx,[ebp+W]

    xor cx,cx
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine
    xor edi,edi
    jmp ciclo2
ciclo2:
    cmp edi,[ebp+n]
    jge nonTrovato
    mov ax,[edx+edi*2]
    cmp ax,cx
    je trovato
    inc edi
    jmp ciclo2
trovato:
    mov [ebx],edi
    add ebx,2
    inc cx
    inc esi
    jmp ciclo
nonTrovato:
    mov [ebx],word -1
    add ebx,2
    inc cx
    inc esi
    jmp ciclo
fine:
    popad
    mov esp,ebp
    pop ebp
    ret 12
