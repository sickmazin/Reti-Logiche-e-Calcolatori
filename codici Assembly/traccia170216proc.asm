;1 v[i]>=0 e v[i+2]<0 e | v[i]-v[i+2] |>4
;2 v[i]<0 e v[i+1]>=0 e | v[i]-v[i+1] |>2 

%include "utils.nasm"

section.data:
    V equ 8
    n equ 12
    res equ 16
section.text:
global traccia170216proc
traccia170216proc:
    push ebp
    mov ebp,esp
    pushad

    mov eax,[ebp+V]   ;indirizzo di V
    mov edi,[ebp+n]    ; edi= n
    sub edi,2

    xor ecx,ecx
    xor esi,esi
ciclo:
    cmp esi,edi
    jge fine
    mov bx,[eax+esi*2]
    cmp bx,0
    jge condizione1
    jl condizione2
    jmp avanti
avanti:
    inc esi
    jmp ciclo
condizione1:
    mov dx,[eax+esi*2+4]
    cmp dx,0
    jge avanti

    sub bx,dx
    cmp bx,0 
    jl valoreassoluto1
    cmp bx,4 
    jg condValida
    jmp avanti
valoreassoluto1:
    neg bx
    cmp bx,4
    jge condValida
    jmp avanti
condizione2:
    mov dx,[eax+esi*2+2]
    cmp dx,0
    jl avanti

    sub bx,dx
    cmp bx,0
    jl valoreassoluto2
    cmp bx,2
    jg condValida
    jmp avanti
valoreassoluto2:
    neg bx
    cmp bx,2
    jg condValida
    jmp avanti
condValida:
    inc ecx
    jmp ciclo

fine:
    mov [ebp+res], ecx
    popad
    pop ebp
    ret 12
