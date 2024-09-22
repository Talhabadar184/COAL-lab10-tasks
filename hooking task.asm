.model small
.stack 200h

.data

msg1 db "Enter your choice: $"
msg2 db "Enter 1st value:  $"
msg3 db "Enter 2nd value:  $"    



v1 db ?
v2 db ?

sum db ?
multiply db ?
divide db ?

.code

main proc
mov ax,@data
mov ds,ax  


            
            

            
mov ah,0x9
int 0x21
mov ah,0x1
int 0x21 
sub al,30h
mov bl,al 



mov ah,0x9
mov dx,offset msg2
int 0x21
mov ah,0x1
int 0x21
sub al,30h
mov ch,al  

mov ah,0x9
mov dx,offset msg3
int 0x21
mov ah,0x1
int 0x21
sub al,30h
mov cl,al  



push bx   ;2
push cx   ;4


               
                    

mov ax,0
mov es,ax
mov word ptr es:[404],choice
mov word ptr es:[406],cs
   
int 0x65


main endp
.exit



; main ending




choice  proc
    
    push bp  ;6
     
     
     
    mov bp,sp
   mov dx,[bp+4] 
   mov bx,[bp+6]
   
   mov cx,0h
   mov cl,dl
   mov si,cx
   mov cx,0h
   mov cl,dh
   mov di,cx 
   
   
   cmp bx,1
   
   jne d
   add si,di 
   mov bx,si 
   jmp en 
   
   
   d: 
   cmp bx,3
   jne m 
    mov ax,di
    mov dx,0h
    div si
     mov bx,0
     mov bl,al 
    jmp en 
    
    
   m:
   
     mov ax,si
     mul di
     mov bx,0
     mov bl,al    
    
   
   
    
    
   
   
   en:
   
   pop bp
   pop cx
   pop bx
   
   
   
   
   
   
   
   
   
    
    
    
      
    
    
    
    









