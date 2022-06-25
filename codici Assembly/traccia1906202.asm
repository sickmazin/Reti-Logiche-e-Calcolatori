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

%include "utils.nasm"

section .data
    V dw 7, 4, -2, 6, -1
    n equ ($-V)/2
    A dw -3
    B dw 1 
    K dw 4

section .bss
    W resw n-1

section .text
global _start
extern traccia190620proc
_start:
    push W
    push dword [K]
    push dword [B]
    push dword [A]
    push dword n
    push V
    call traccia190620proc
    xor esi,esi
c: cmp esi, n-1
    jge e
    printw word [W + esi * 2]
    INC esi
    JMP c
e:  exit 0