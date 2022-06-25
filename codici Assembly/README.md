In questa cartella sono presenti tutte le tracce che ho provato a svolgere di Assembly. 
Alcune tracce sono funzionanti al 100%, altre possono presentare qualche errore che riguarda l'utilizzo dei registri poiché erano le prime prove.
Molte tracce presentano anche dei commenti, altre no. 

Se volete provare ad eseguire questi codici:

nasm -f elf32 nomefile.asm

nasm -f elf32 nomefileProcedura.asm

ld -m elf_i386 nomefile.o nomefileProcedura.o utils.o -o nomeTraccia
