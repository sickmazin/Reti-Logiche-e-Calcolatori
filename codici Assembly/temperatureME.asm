%include "utils.nasm"

section .data
    V dw 8,10,0,5,-1,3,-4,3,7,12
    len equ ($-V)/2
;pari temp minima 
;disp temp max

section .bss 
W resw 2

section .text
global _start
extern temperatureproc
_start:
    push W
    push dword len
    push V
    call temperatureproc
    printw word [W]
    printw word [W+2]
    exit 0