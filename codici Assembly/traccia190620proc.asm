%include "utils.nasm"
; ESERCIZIO 3: Scrivere una procedura assembly che riceve un vettore di word  V ed un vettore di double word W,
; con V avente dimensione n e W avente dimensione n-1, e tre parametri A, B e K. Ciascun elemento di W è calcolato come segue:
; W[i] = 0   se   A*V[i] + B*V[i+1] > K   e   W[i] = 1 altrimenti
; Scrivere inoltre il programma principale che invoca opportunamente la procedura descritta.
; In figura è riportato un esempio dello stato della memoria prima e dopo la chiamata alla procedura.
; Gli elementi del vettore W sono calcolati come segue:
; W[0] ← 0   poiché   7*(-3) + 4*1 = -17   è minore o uguale a   K=4
; W[1] ← 0   poiché   4*(-3) + (-2)*1 = -14   è maggiore di   K=4
; W[2] ← 1   poiché   (-2)*(-3) + 6*1 = 12   è minore o uguale a   K=4
; W[3] ← 0   poiché   6*(-3) + (-1)*1 = -19   è minore o uguale a   K=4

section .data
    V equ 8
    n equ 12
    A equ 16
    B equ 20
    K equ 24
    W equ 28
section .text
global traccia190620proc
traccia190620proc:
    push ebp
    mov ebp,esp
    pushad

    mov edx,[ebp+W] ; indirizzo di W
    mov ebx,[ebp+V] ; indirizzo di V
    mov edi,[ebp+n] ; edi= n
    dec edi         ; edi = n-1

    xor eax,eax
    xor esi,esi     ; i = 0
ciclo:
    cmp esi,edi    ; i>= n-1
    jge fine
    xor ecx,ecx      ;
    mov ax,[ebx+esi*2]  ;ax= v[i]
    imul ax,[ebp+A]    ; ax= ax*A
    mov cx,ax             ; cx = A* v[i]
    mov ax,[ebx+esi*2+2]  ; ax= V[i+1]
    imul ax,[ebp+B]       ; ax= v[i+1]*B
    add cx,ax             ; ax+cx
    mov ax,[ebp+K]
    cmp cx,ax
    jle condValida
    mov cx, word 1
    jmp avanti
condValida:
    xor cx,cx
avanti:
    mov [edx+esi*2],word cx
    inc esi
    jmp ciclo
fine:
    
    popad
    pop ebp
    ret 24