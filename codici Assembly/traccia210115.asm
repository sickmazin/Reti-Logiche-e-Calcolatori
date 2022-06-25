;Vettore V di word e restituisce il numero di elementi distinti presenti in V
;Traccia 21 05 15
%include "utils.nasm"

section .data
    V dw 1,1,2,3,2,4,5,4
    n equ ($-V)/2
section .bss
    cont resw 1
section .text
global _start
extern traccia210115proc
_start:
    push cont
    push dword n
    push V
    call traccia210115proc
    print word [cont]
    exit 0