%include "utils.nasm"

section .data
    A equ  8
    nA equ  12
    B equ   16
    nB equ  20
    res equ 24
section .text
global traccia090915proc
traccia090915proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+A] ; INDIRIZZO DI A
    mov ebx,[ebp+B]
    mov eax,[ebp+res]
    
    movsx edi,word [edx]
    mov cx,[ebx+edi*2]
    
    xor esi,esi
ciclo:
    cmp esi, [ebp+nA]
    jge fine
    movsx edi,word [edx+esi*2]
    cmp cx,[ebx+edi*2]
    jg fine_0
    mov cx,[ebx+edi*2]
    inc esi
    mov [eax],word 1
    jmp ciclo
fine_0:
    mov [eax],word 0
fine:
    popad
    mov esp,ebp
    pop ebp
    ret 20
