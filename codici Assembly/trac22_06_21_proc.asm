%include "utils.nasm"

section .data
    V equ  8
    n equ  12
    cont equ 16

section .text
global trac22_06_21_proc
trac22_06_21_proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]
    
    mov edi,[ebp+n]
    dec edi
    mov [ebp+n],edi

    xor ecx,ecx
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine
    mov ax,[edx+esi*2]  ; ax= v[i]
    mov bx,[edx+esi*2+2] ; bx = v[i+1]
    imul bx,4
    cmp ax,bx
    jg scambia
    inc esi
    jmp ciclo
scambia:
    mov [edx+esi*2],bx
    mov [edx+esi*2+2],ax
    inc cx
    inc esi
    jmp ciclo
fine:
    mov eax,[ebp+cont]
    mov [eax],cx
    popad
    mov esp,ebp
    pop ebp
    ret 12
