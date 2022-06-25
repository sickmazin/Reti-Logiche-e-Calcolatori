%include "utils.nasm"

section .data
    V equ 8
    n equ 12
    cont equ 16
section .text
global traccia210115proc
traccia210115proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]  ;vettore V
    
    mov [ebp+cont], word 0
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]  ; i>=n
    jge fine
    mov ax,[edx+esi*2] ; ax = V[i]
    xor ecx,ecx        ; j=0
    xor edi,edi        ; contatore di occorrenze di ax in V
    jmp ciclo2
ciclo2:
    cmp ecx,[ebp+n]
    jge fine_ciclo2
    mov bx,[edx+ecx*2]  ; bx = V[j]
    cmp ax,bx           ; V[j] == V[i] ?
    je incrementa
    inc ecx
    jmp ciclo2
incrementa:
    inc edi
    inc ecx
    jmp ciclo2
fine_ciclo2:
    cmp edi,1
    je distinti
    inc esi
    jmp ciclo
distinti:
    add [ebp+cont], word 1
    inc esi
    jmp ciclo 
fine:

    popad
    pop ebp
    ret 12

