%include "utils.nasm"

section .data
    V dd 4,3,6,13,25,51
    n equ ($-V)/4

section .bss
    ris resw 1

section .text
global _start
extern checkSum_proc
_start:
    push ris
    push dword n
    push V
    call checkSum_proc
    printw word [ris]
    exit 0