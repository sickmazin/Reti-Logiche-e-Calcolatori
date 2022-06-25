%include "utils.nasm"

section .data
    ris equ 16
    n equ 12
    V equ 8

section .text 
global getMax_proc
getMax_proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]
    
    xor bx,bx
    xor esi,esi
cicloPari:
    cmp esi,[ebp+n]
    jge finepari
    mov ax,[edx+esi*2]
    ror ax,1
    jc avanti
    rol ax,1
    cmp ax,0
    jl valoreAssoluto
    add bx,ax
    inc esi
    jmp cicloPari
avanti:
    inc esi
    jmp cicloPari
valoreAssoluto:
    neg ax
    add bx,ax 
    inc esi
    jmp cicloPari
finepari:
    xor esi,esi
    inc esi
cicloDispari:
    cmp esi,[ebp+n]
    jge fine1
    mov ax,[edx+esi*2]
    add cx,ax
    add esi,2
    jmp cicloDispari
fine1:
    cmp bx,cx
    jg fineB
    mov eax,[ebp+ris]
    mov [eax],cx
    popad
    mov esp,ebp
    pop ebp
    ret 12
fineB:
    mov eax,[ebp+ris]
    mov [eax],bx
    popad
    mov esp,ebp
    pop ebp
    ret 12