%include "utils.nasm"

section .data
    moda equ 16
    n equ 12
    V equ 8
section .bss
    cont resd 1
section .text
global moda_proc
moda_proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]  ;edx indirizzo di V
    
    xor edi,edi      ; num di comparse del num
    xor esi,esi

    
    
ciclo:
    cmp esi,[ebp+n]
    jge fine
    mov eax,[edx+esi*4]  ;eax= v[i]
    xor ecx,ecx
    mov ecx,esi
    xor esi,esi
ciclo2:
    cmp esi,[ebp+n]
    jge fine_ciclo2
    mov ebx,[edx+esi*4]

    cmp eax,ebx
    je aumenta

    inc esi
    jmp ciclo2
aumenta:
    inc edi
    inc esi
    jmp ciclo2
fine_ciclo2:
    cmp edi,[cont]
    jg cambiaModa
    mov esi,ecx
    xor edi,edi
    jmp ciclo
cambiaModa:
    mov [cont],edi 
    mov ebx,[ebp+moda]
    mov [ebx],eax
    jmp ciclo
fine:
    
    popad
    mov esp,ebp
    pop ebp
    ret 16