logic.asm
.model small
.stack 100h
.data
myStringdb "Proud to be TIPians","$"
.code
main proc
movax,@data
movds,ax
movbx,offsetmyString
LP1: mov dl,[bx]
Cmp dl, '$'
Je exit
Incbx
and dl, 11011111B
mov ah,02
int 21h
jmp lp1
Exit: Mov ax, 4c00h
Int 21h
Main endp
End main
