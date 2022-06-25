%include "utils.nasm"

section .data:
    v equ 20
    n equ 16
    d equ 12
    ris equ 8

section .text:
global traccia16_07_20_proc
traccia16_07_20_proc:
    push ebp
    mov ebp,esp
    pushad

    mov eax,[ebp+v]
    mov edi,[ebp+n]
    mov edx, [ebp+d]

    dec edi
    xor esi,esi
ciclo_0:
    cmp esi,edi
    jge fine
    mov ecx,[eax+esi*2]
    cmp ecx,0
    je trovato_0
    inc esi
    jmp ciclo_0
trovato_0:
    mov edi,esi
    xor ecx,ecx
    xor esi,esi
    jmp ciclo
ciclo:
    cmp esi,edi
    jge secondo_blocco_0
    mov ebx,[eax+esi*2]
    cmp ebx,edx
    jge esterno
    neg edx
    cmp ebx,edx
    jle esterno
    neg edx
    jmp avanti
esterno:
    add ecx,ebx
    jmp avanti
secondo_blocco_0:
    mov edi,[ebp+n]
    dec edi
    jmp secondo_blocco
secondo_blocco:
    cmp esi,edi
    jge fine
    mov ebx,[eax+esi*2]
    cmp ebx,edx
    jge avanti
    neg edx
    cmp ebx,edx
    jle avanti
    sub ecx,[eax+esi*2]
    neg edx
    jmp avanti_2
avanti_2:
    inc esi
    jmp secondo_blocco
avanti:
    inc esi
    jmp ciclo
fine:
    mov [ebp+ris],ecx
    pushad
    push ebp
    ret 16

