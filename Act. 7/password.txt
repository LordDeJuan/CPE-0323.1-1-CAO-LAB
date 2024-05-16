TITLE password.asm
dosseg
.model small
.stack
.data
    password db "password123", "$"
    input_buffer db 11, "$"
    stars db 10 dup('*'), "$"
    correct_msg db 13, 10, "Password is CORRECT!$"
    incorrect_msg db 13, 10, "Password is INCORRECT!$"
.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset input_prompt
    mov ah, 09h
    int 21h

    mov dx, offset input_buffer
    mov ah, 0ah
    int 21h

    mov dx, offset stars
    mov ah, 09h
    int 21h

    mov si, offset password
    mov di, offset input_buffer
    mov cx, 10
compare_loop:
    mov al, [si]
    cmp al, '$'
    je end_compare
    cmp al, [di]
    jne incorrect
    inc si
    inc di
    loop compare_loop
end_compare:
    cmp al, [di]
    jne incorrect
    mov dx, offset correct_msg
    jmp print_message

incorrect:
    mov dx, offset incorrect_msg
print_message:
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
main endp

input_prompt db 13, 10, "Enter the password: $"

end main

