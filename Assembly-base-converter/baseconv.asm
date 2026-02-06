
; Decimal to Binary and Hex converter (NASM x86_64)
; Hardcoded input number (1234) -> prints decimal, binary, and hex

global main
section .data
num:    dq 1234              ; test number
txt_dec: db "Decimal: ",0
txt_bin: db "Binary : ",0
txt_hex: db "Hex    : ",0
nl:      db 10
hexchars: db "0123456789ABCDEF"
buffer:  times 128 db 0

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

    lea rsi,[rel buffer+128]
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
    lea rcx,[rel buffer+128]
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

; print_binary (rax=value)
print_binary:
    push rcx
    push rbx
    push rdx
    push rsi

    mov rcx,64
    lea rsi,[rel buffer]
.loopb:
    shl rax,1
    jc .one
    mov byte [rsi],'0'
    jmp .cont
.one:
    mov byte [rsi],'1'
.cont:
    inc rsi
    loop .loopb

    ; skip leading zeros
    lea rsi,[rel buffer]
.skip:
    cmp byte [rsi],'0'
    jne .print
    inc rsi
    jmp .skip
.print:
    lea rcx,[rel buffer+64]
    mov rdx,rcx
    sub rdx,rsi
    mov rax,1
    mov rdi,1
    syscall

    pop rsi
    pop rdx
    pop rbx
    pop rcx
    ret

; print_hex (rax=value)
print_hex:
    push rcx
    push rdx
    push rsi
    push rbx

    lea rsi,[rel buffer+128]
    mov byte [rsi],0

    test rax,rax
    jnz .loop
    dec rsi
    mov byte [rsi],'0'
    jmp .out

.loop:
    xor rdx,rdx
    mov rbx,16
    div rbx
    mov bl,[rel hexchars+rdx]
    dec rsi
    mov [rsi],bl
    cmp rax,0
    jne .loop

.out:
    lea rcx,[rel buffer+128]
    mov rdx,rcx
    sub rdx,rsi
    mov rax,1
    mov rdi,1
    syscall

    pop rbx
    pop rsi
    pop rdx
    pop rcx
    ret

main:
    ; print decimal
    lea rsi,[rel txt_dec]
    mov rdx,9
    call print_string
    mov rax,[rel num]
    call print_number_decimal
    lea rsi,[rel nl]
    mov rdx,1
    call print_string

    ; print binary
    lea rsi,[rel txt_bin]
    mov rdx,9
    call print_string
    mov rax,[rel num]
    call print_binary
    lea rsi,[rel nl]
    mov rdx,1
    call print_string

    ; print hex
    lea rsi,[rel txt_hex]
    mov rdx,9
    call print_string
    mov rax,[rel num]
    call print_hex
    lea rsi,[rel nl]
    mov rdx,1
    call print_string

    ; exit
    mov rax,60
    xor rdi,rdi
    syscall

