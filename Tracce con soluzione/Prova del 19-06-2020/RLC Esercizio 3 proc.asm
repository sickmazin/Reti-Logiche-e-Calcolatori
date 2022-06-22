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

%include 'utils.nasm'

section .data
v equ 22
n equ 18
a equ 16
b equ 14
k equ 12
w equ 8

section .text
global proc
proc:
    PUSH EBP
    MOV EBP, ESP
    PUSHAD
    MOV EAX, [EBP + v]          ; vettore v
    MOV EBX, [EBP + w]          ; vettore w
    MOV ESI, [EBP + n]          ; lunghezza del vettore
    DEC ESI                     ; n-1
    XOR EDI, EDI                ; indice
c:  CMP EDI, ESI
    JGE x
    MOV CX, [EAX + EDI * 2]     ; v[i]
    MOV DX, [EAX + EDI * 2 + 2] ; v[i + 1]
    IMUL CX, [EBP + a]          ; a*v[i]
    IMUL DX, [EBP + b]          ; b*v[i+1]
    ADD CX, DX                  ; a*v[i] + b*v[i+1]
    XOR EDX, EDX
    CMP CX, [EBP + k]           ; a*v[i] + b*v[i+1] > k?
    JG s0
    INC EDX
s0: MOV [EBX + EDI * 4], EDX    ; w[i]
    INC EDI
    JMP c
x:  POPAD
    POP EBP
    RET 18
