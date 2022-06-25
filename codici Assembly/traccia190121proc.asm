%include "utils.nasm"

section .data
    V equ 8
    n equ 12
    ris equ 16

section .text
global traccia190121proc
traccia190121proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+V]

    
    mov edi,[ebp+n]
    shr edi,1 

    mov cx,[edx+edi*2]   ;ecx= V[n/2]
    
     
    mov ebx,edx
    add ebx,2
    add ebx,edi  ; indirizzo meta vettore ebx = V[n/2+1]

     
    mov [ebp+n],edi
    

    xor edi,edi
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine
    mov ax,[edx+esi*2]  ; ax = v[i]
    sub ax,[ebx+esi*2]  ; ax - v[i+n/2+1]
    cmp ax,0
    jge compara
    neg ax

compara:
    cmp ax,cx
    jle avanti
    inc edi
avanti:
    inc esi
    jmp ciclo
fine:
    mov eax,[ebp+ris]
    mov [eax],edi
    popad
    mov esp,ebp
    pop ebp
    ret 12