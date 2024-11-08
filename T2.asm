section .data
    prompt db "Enter a string: ", 0
    newline db 10, 0

section .bss
    buffer resb 100      ; buffer for storing input

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read string
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100         ; max number of bytes to read
    int 0x80

    ; Output string
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
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
