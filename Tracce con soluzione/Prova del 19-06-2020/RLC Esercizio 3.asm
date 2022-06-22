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
v dw 7, 4, -2, 6, -1
n equ ($-v)/2
a dw -3
b dw 1
k dw 4

section .bss
w resd n-1

section .text
extern proc
global _start
_start:
    PUSH v
    PUSH dword n
    PUSH word [a]
    PUSH word [b]
    PUSH word [k]
    PUSH w
    CALL proc
    XOR EDI, EDI
c:  CMP EDI, n-1
    JGE e
    printd dword [w + EDI * 4]
    INC EDI
    JMP c
e:  exit 0
