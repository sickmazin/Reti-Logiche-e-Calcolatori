;TRACCIA 17 02 2016

%include "utils.nasm"

section.data:
    V dw -1,3,-2,-5,10,-6,2,-1
    n equ ($-V)/2
section.bss:
    res resw 1
section.text:
global _start
extern traccia170216proc
_start:
    push res
    push dword n
    push V
    call traccia170216proc
    printw word [res]
    exit 0