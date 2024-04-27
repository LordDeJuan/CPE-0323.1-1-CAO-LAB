.model small
.stack
.data
    prompt1 db 13,10,"Hello, What's your name? $"
    prompt2 db 13,10,"Hello, $"
    greeting db 13,10,"Congratulations! Your first program is working!$"
    buffer db 31,?,31 dup('$') ; Maximum length 30 characters for the name + 1 for null terminator
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt1
    lea dx, prompt1
    mov ah, 09h
    int 21h

    ; Read user's name
    lea dx, buffer
    mov ah, 0ah
    int 21h

    ; Display prompt2
    lea dx, prompt2
    mov ah, 09h
    int 21h

    ; Display the entered name
    lea dx, buffer + 2 ; Offset 2 contains the length of the input
    mov ah, 09h
    int 21h

    ; Display the greeting
    lea dx, greeting
    mov ah, 09h
    int 21h

    ; Exit the program
    mov ax, 4c00h
    int 21h
main endp
end main