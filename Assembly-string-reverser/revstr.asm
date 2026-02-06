; String reverser in x86_64 NASM (Linux)
; Reads up to 128 bytes from stdin, reverses the characters (excluding trailing newline), prints result and then newline if present.

global main

section .bss
buf:    resb 128
out:    resb 128

section .data
nl:     db 10

section .text
; --- sys_read: rax=0, rdi=fd, rsi=buf, rdx=count ; returns rax=bytes_read
; --- sys_write: rax=1, rdi=fd, rsi=buf, rdx=count

main:
    ; read up to 128 bytes
    mov rax, 0          ; sys_read
    mov rdi, 0          ; stdin
    lea rsi, [rel buf]
    mov rdx, 128
    syscall

    cmp rax, 0
    je .exit            ; nothing read

    mov rbx, rax        ; rbx = bytes_read

    ; check if last byte is newline (10)
    mov rcx, rbx
    dec rcx
    lea rdx, [rel buf]
    mov al, [rdx + rcx]
    cmp al, 10
    jne .no_nl
    ; has newline: reduce length by 1 and set flag in r12
    dec rbx
    mov r12b, 1
    jmp .prepare

.no_nl:
    xor r12b, r12b

.prepare:
    ; rbx = length to reverse
    ; reverse into 'out' buffer
    xor rsi, rsi        ; index i = 0 (for out)
    mov r13, rbx        ; r13 = remaining count

    ; if rbx == 0 skip loop
    cmp r13, 0
    je .write_out

.rev_loop:
    ; load byte from buf + (r13 - 1)
    lea rdx, [rel buf]
    mov rax, r13
    dec rax
    mov dl, [rdx + rax]

    ; store into out[rsi]
    lea rdx, [rel out]
    mov [rdx + rsi], dl

    inc rsi
    dec r13
    cmp r13, 0
    jne .rev_loop

.write_out:
    ; write reversed data (length = rbx)
    mov rax, 1
    mov rdi, 1          ; stdout
    lea rsi, [rel out]
    mov rdx, rbx
    syscall

    ; if had newline, write newline
    cmp r12b, 0
    je .exit

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel nl]
    mov rdx, 1
    syscall

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall
