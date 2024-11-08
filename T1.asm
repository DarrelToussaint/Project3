section .data
    prompt db "Enter a number: ", 0
    newline db 10, 0

section .bss
    number resb 10       ; buffer for storing the number as a string

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read number (string format)
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 10          ; max number of bytes to read
    int 0x80

    ; Output number (string format)
    mov eax, 4
    mov ebx, 1
    mov ecx, number
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
    int 0x80
    

