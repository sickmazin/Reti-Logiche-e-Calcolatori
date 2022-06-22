section .data
v equ 18
n equ 14
d equ 12
ris equ 8

section .text
global proc
proc:
            PUSH EBP
            MOV EBP, ESP
            PUSHAD
            MOV EAX, [EBP + v]      ; vettore v
            XOR EDI, EDI            ; indice array
            MOV ESI, [EBP+n]        ; n
            MOV CX, [EBP + d]       ; d
            XOR DX, DX              ; somma
            MOV BX, [EAX]           ; v[i]
ciclo1:     CMP BX, 0
            JE ciclo2
            CMP BX, CX
            JG somma
            NEG BX
            CMP BX, CX
            JG nsomma
pe:         INC EDI
            MOV BX, [EAX + EDI*2]
            JMP ciclo1
nsomma:     NEG BX
somma:      ADD DX, BX
            JMP pe
ciclo2:     CMP EDI, ESI
            JGE ritorna
            MOV BX, [EAX + EDI*2]
            CMP BX, CX
            JG pe2
            NEG BX
            CMP BX, CX
            JG pe2
            NEG BX
            SUB DX, BX
pe2:        INC EDI
            JMP ciclo2
ritorna:    MOV EAX, [EBP + ris]
            MOV [EAX], DX
            POPAD
            POP EBP
            RET 14
