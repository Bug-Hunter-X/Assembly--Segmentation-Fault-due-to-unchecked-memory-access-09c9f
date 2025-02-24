section .data
    array dw 10, 20, 30, 40 ; Sample array
    array_length equ ($ - array) / 2

section .bss
    result resd 1

section .text
    global _start

_start:
    mov ebx, array ; ebx points to array
    mov ecx, 2 ; ecx is the index (check that is within the bounds)
    cmp ecx, array_length ; Check that ecx is within the bounds of the array
    jae error_handling ; Jump if index is out of bounds
    mov eax, [ebx + ecx*2] ; Access array element (2 bytes per element)
    mov [result], eax
    jmp exit

error_handling:
    ; Handle out of bounds error (e.g., exit with error code)
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80