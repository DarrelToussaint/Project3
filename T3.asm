section .data
    prompt db "Enter a character: ", 0
    newline db 10, 0

section .bss
    char resb 1

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, prompt      ; pointer to the message
    mov edx, 17          ; message length
    int 0x80

    ; Read character
    mov eax, 3           ; syscall number for sys_read
    mov ebx, 0           ; file descriptor (stdin)
    mov ecx, char        ; buffer to store character
    mov edx, 1           ; number of bytes to read
    int 0x80

    ; Output character
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, char        ; buffer with character
    mov edx, 1           ; number of bytes to write
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80
