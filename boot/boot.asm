[org 0x00]
[bits 16]

section code

.init:
    mov eax, 0x07c0
    mov ds, eax
    mov eax, 0xb800
    mov es, eax
    mov eax, 0 ; set eax to 0 -> i = 0
    mov ebx, 0 ; Index of the character in the string , we printing
    mov ecx, 0 ; Actual adress of the character
    mov dl, 0 ; Actual value that we are printing 


.clear:
    mov byte [es:eax], 0 ; Move blank character to current address
    inc eax
    mov byte [es:eax], 0x30 ; Move the bkground color and character color to next address
    inc eax

    cmp eax, 2 * 25 * 80

    jl .clear

mov eax, text1
push .end

.print:
    mov dl, byte [eax + ebx]

    cmp dl, 0
    je .print_end

    mov byte [es:ecx], dl

    inc ebx
    inc ecx        
    inc ecx

    jmp .print

.print_end:
    mov eax, 0;

.end:
    jmp $

text: db 'Hello World!', 0
text1: db 'Vidusahan, Heshani, Malanka, Themiya, Dunith', 0

times 510 - ($ - $$) db 0x00 ; Pads the files with 0s, making it the right size

db 0x55
db 0xaa