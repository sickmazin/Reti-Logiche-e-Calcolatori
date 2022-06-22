%include 'utils.nasm'
section .data
v dw 2, -10, 13, 5, 0, 1, -9, 3
n equ ($-v)/2
d dw 7

section .bss
ris resw 1

section .text
extern proc
global _start
_start:

    PUSH v
    PUSH dword n
    PUSH word [d]
    PUSH ris
    CALL proc
    printw word [ris]
    exit 0
