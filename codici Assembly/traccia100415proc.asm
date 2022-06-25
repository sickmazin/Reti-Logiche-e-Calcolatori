%include "utils.nasm"

section .data
    V equ 8
    W equ 12
    n equ 16
    pos equ 20
section .text
global traccia100415proc
traccia100415proc:
    push ebp 
    mov ebp,esp
    pushad
 
    mov ebx,[ebp+V]  ;indirizzo di V
    mov edx,[ebp+W]  ;indirizzo di W
    
    mov ecx,[ebp+pos]  
    mov [ecx], word 0   ;azzerro le posizioni valide

    mov edi,[ebp+n]
    imul edi,2
    sub edi,2     
    add edx,edi   ; edx= edx+n-1

    xor ecx,ecx
    xor eax,eax
    xor edi,edi
    xor esi,esi
ciclo:
    cmp esi,[ebp+n]
    jge fine
    mov eax,[ebx+esi*4]

    sub edx,esi    
    sub edx,esi  ;edx = edx-esi  (n-p-1)
    
    movsx ecx,word [edx]  ; ecx = W[i]
    
    add edx,esi    
    add edx,esi  

    rol eax,1
    jc negativo
    rol ecx,1
    jc avanti
    inc esi
    jmp ciclo
negativo:
    rol ecx,1
    jnc avanti
    inc esi
    jmp ciclo
avanti:
    inc di
    inc esi 
    jmp ciclo
fine:
    mov eax,[ebp+pos]
    mov [eax],di

    popad
    mov esp,ebp
    pop ebp
    ret 16
    
        
