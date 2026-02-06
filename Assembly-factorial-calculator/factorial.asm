global main
section .data
num:    dq 10          ; number to compute factorial for
txt_num: db "Number: ",0
txt_fact: db "Factorial: ",0
nl:     db 10
buffer: times 32 db 0
hexchars: db "0123456789"

section .text
; print_string: rsi=ptr, rdx=len
print_string:
    mov rax,1
    mov rdi,1
    syscall
    ret

; print_number_decimal (rax=value)
print_number_decimal:
    push rbx
    push rcx
    push rdx
    push rsi

    lea rsi,[rel buffer+32]
    mov byte [rsi],0

    test rax,rax
    jnz .conv
    dec rsi
    mov byte [rsi],'0'
    jmp .out

.conv:
    mov rbx,10
.loop:
    xor rdx,rdx
    div rbx
    add dl,'0'
    dec rsi
    mov [rsi],dl
    cmp rax,0
    jne .loop

.out:
    lea rcx,[rel buffer+32]
    mov rdx,rcx
    sub rdx,rsi
    mov rax,1
    mov rdi,1
    syscall

    pop rsi
    pop rdx
    pop rcx
    pop rbx
    ret

main:
    ; print input number
    lea rsi,[rel txt_num]
    mov rdx,8
    call print_string
    mov rax,[rel num]
    call print_number_decimal
    lea rsi,[rel nl]
    mov rdx,1
    call print_string

    ; calculate factorial
    mov rax,1          ; factorial result
    mov rcx,[rel num]
    cmp rcx,0
    je .done_calc
.loop_fact:
    mul rcx           ; rax = rax * rcx
    dec rcx
    cmp rcx,0
    jne .loop_fact
.done_calc:

    ; print factorial
    lea rsi,[rel txt_fact]
    mov rdx,11
    call print_string
    call print_number_decimal
    lea rsi,[rel nl]
    mov rdx,1
    call print_string

    ; exit
    mov rax,60
    xor rdi,rdi
    syscall