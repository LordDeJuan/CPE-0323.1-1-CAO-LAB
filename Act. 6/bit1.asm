TITLE bit.asm
.model small
.stack 100h
.data
num db 0ah
.code
main proc
movax,@data
movds,ax
movbl,num
mov cx,8
here: shr bl,1
Jcis_one
Mov dl,30h
Jmp print
Is_one:
Mov dl,31h
Print:
Mov ah,2
int 21h
loop here
Exit: Mov ax, 4c00h
Int 21h
Main endp
End main
