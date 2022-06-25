%include "utils.nasm"

section .data
    v equ 8
    w equ 16
    n equ 12
section .text
global proc200616
proc200616:
    push ebp
    mov ebp,esp
    pushad

    mov eax,[ebp+v]
    mov ebx,[ebp+w]
    mov edi,[ebp+n]
    add eax,edi
    
    shr edi,1
    
    xor esi,esi
ciclo1:
    cmp esi,edi
    jge fine_ciclo1
    mov cx,[ebx+esi*2]
    mov dx,[eax+esi*2]
    cmp cx,dx
    jg condizioneValida1
    xor cx,cx
    jmp avanti1
condizioneValida1:
    add cx,dx
avanti1:
    mov [ebx+esi*2], cx ; W[i] = x
    inc esi
    jmp ciclo1
fine_ciclo1:   
    mov eax,[ebp+v]
    lea ebx,[ebx+edi*2]
    xor esi,esi
ciclo2:
    cmp esi,edi
    jge fine
    mov cx,[ebx+esi*2]
    mov dx,[eax+esi*2]
    cmp cx,dx
    jg condizioneValida2
    xor cx,cx
    jmp avanti2
condizioneValida2:
    add cx,dx
avanti2:
    mov [ebx+esi*2], cx ; W[i] = x
    inc esi
    jmp ciclo2
fine:
    popad
    pop ebp
    ret 12
