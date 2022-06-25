%include "utils.nasm"

section .data
    V equ 8
    K equ 12
    n equ 16
    ris equ 20
section .text
global traccia28_1_2016_proc
traccia28_1_2016_proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]
    mov bx,[ebp+K]
    mov edi,[ebp+n]
    sub edi,2
    
    xor esi,esi  ;i=0
ciclo:
    cmp esi,edi; i>=n
    jge fine_0
    mov cx,[edx+esi*2]
    and cx,1
    jnz avanti
    mov ax,[edx+esi*2]
    mov cx,[edx+esi*2+2]
    and cx,1
    jnz avanti
    add ax,[edx+esi*2+2]
    mov cx,[edx+esi*2+4]
    and cx,1
    jnz avanti
    add ax,[edx+esi*2+4]
    jmp compara
avanti:
    inc esi
    jmp ciclo
compara:
    cmp ax,bx
    jg fine_1
    inc esi 
    jmp ciclo
fine_0:
    xor cx,cx
    jmp fine
fine_1:
    mov cx,word 1
fine:
    mov eax,[ebp+ris]
    mov [eax],cx
    popad
    mov esp,ebp
    pop ebp
    ret 16

