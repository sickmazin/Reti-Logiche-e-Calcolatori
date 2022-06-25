%include "utils.nasm"

section .data
    V equ 8
    len equ 12
    W equ 16
section .text
global temperatureproc
temperatureproc:
    push ebp
    mov ebp,esp
    pushad

    mov ebx,[ebp+V]
    
    xor eax,eax  ;escursione termica media
    xor edx,edx  ;escurione massima

    xor esi,esi
    
ciclo:
    cmp esi,[ebp+len]
    jge fine
    mov cx,[ebx+esi*2+2]  ; ax = v[i+1]
    sub cx,[ebx+esi*2]  ; ax - v[i+1]
    inc esi
    inc esi
    add ax,cx
    cmp cx,dx
    jg  cambioEsc
    jmp ciclo
cambioEsc:
    mov dx,cx
    jmp ciclo
fine:
    mov ebx,[ebp+W]
    mov [ebx],dx
    mov edi,[ebp+len]
    shr di,1
    xor dx,dx
    idiv di
    mov [ebx+2],ax
    popad
    pop ebp
    ret 12