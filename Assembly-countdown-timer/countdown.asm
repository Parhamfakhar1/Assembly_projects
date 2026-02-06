; Countdown timer in x86_64 NASM (Linux)
; Prints numbers from 10 down to 0 with a 1-second delay between each.

global main
extern sleep

section .data
nl:     db 10
pad:    times 31 db 0    ; buffer end padding

section .bss
; none

section .text
main:
    ; rcx will hold the current number
    mov rcx, 10

.loop_print:
    ; Prepare pointer to end of buffer
    lea rsi, [rel pad + 31]    ; rsi -> one past end (we'll build string backwards)
    mov byte [rsi], 0         ; null terminator

    mov rax, rcx              ; copy number to rax for division/itoa
    cmp rax, 0
    jne .conv_number

    ; special-case 0
    dec rsi
    mov byte [rsi], '0'
    jmp .write_number

.conv_number:
    ; convert rax (non-negative) to ASCII digits backwards
.conv_loop:
    xor rdx, rdx
    mov rbx, 10
    div rbx                   ; rax = rax / 10, rdx = rax % 10
    add dl, '0'
    dec rsi
    mov [rsi], dl
    cmp rax, 0
    jne .conv_loop

.write_number:
    ; write number (from rsi to pad+31)
    lea rdi, [rel pad + 31]
    sub rdi, rsi              ; rdi = length
    mov rdx, rdi              ; rdx = length

    mov rax, 1                ; sys_write
    mov rdi, 1                ; fd = stdout
    ; rsi already points to buffer start
    syscall

    ; write newline
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel nl]
    mov rdx, 1
    syscall

    ; sleep(1)
    mov rdi, 1
    call sleep

    ; if rcx == 0 -> exit, else decrement and loop
    cmp rcx, 0
    je .exit
    dec rcx
    jmp .loop_print

.exit:
    mov rax, 60   ; sys_exit
    xor rdi, rdi
    syscall
