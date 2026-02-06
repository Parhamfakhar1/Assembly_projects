
; Multiplication table 1..10 in x86_64 NASM (Linux)
; Prints lines like: "A x B = C\n"

global main
section .data
str_x:      db ' x ',0
len_x:      equ $ - str_x
str_eq:     db ' = ',0
len_eq:     equ $ - str_eq
nl:         db 10

buffer:     times 32 db 0    ; temporary buffer for number->string conversion

section .text
; print_string: rsi -> address, rdx -> length
print_string:
    mov rax, 1      ; sys_write
    mov rdi, 1      ; stdout
    syscall
    ret

; print_number: prints unsigned number in rax
; uses buffer; clobbers rax, rbx, rcx, rdx, rsi
print_number:
    push rbx
    push rcx
    push rdx
    push rsi

    lea rsi, [rel buffer + 32]
    mov byte [rsi], 0

    test rax, rax
    jnz .conv
    ; zero
    dec rsi
    mov byte [rsi], '0'
    jmp .out

.conv:
    mov rbx, 10
.conv_loop:
    xor rdx, rdx
    div rbx          ; rax = rax / 10 ; rdx = remainder
    add dl, '0'
    dec rsi
    mov [rsi], dl
    cmp rax, 0
    jne .conv_loop

.out:
    ; write from rsi to buffer+32
    lea rcx, [rel buffer + 32]
    mov rdx, rcx
    sub rdx, rsi     ; length = end - start
    mov rax, 1
    mov rdi, 1
    ; rsi already points to buffer start
    syscall

    pop rsi
    pop rdx
    pop rcx
    pop rbx
    ret

main:
    ; outer loop i = 1..10
    mov r12, 1
.outer_loop:
    cmp r12, 11
    jge .done

    mov r13, 1
.inner_loop:
    cmp r13, 11
    jge .next_row

    ; print r12
    mov rax, r12
    call print_number

    ; print " x "
    lea rsi, [rel str_x]
    mov rdx, len_x
    call print_string

    ; print r13
    mov rax, r13
    call print_number

    ; print " = "
    lea rsi, [rel str_eq]
    mov rdx, len_eq
    call print_string

    ; compute r12 * r13 -> r14
    mov rax, r12
    mul r13     ; rdx:rax = rax * r13 ; since r13 small, rax holds result
    mov rax, rax
    call print_number

    ; newline
    lea rsi, [rel nl]
    mov rdx, 1
    call print_string

    inc r13
    jmp .inner_loop

.next_row:
    inc r12
    jmp .outer_loop

.done:
    ; exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall