.model small
.stack 200h

.data

msg1 db 10,13,"Enter your choice: $"
msg2 db 10,13,"Enter 1st value:  $"
msg3 db 10,13,"Enter 2nd value:  $"    



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

; for choice 1 addition
cmp bx,1  
jne choice2
call addi  

;check for choice 2 multiply
choice2:
cmp bx,2  
jne choice3
call mult 


;check for choice 3 div
choice3:
call divi
            
                    
addhook:
mov ax,0
mov es,ax
mov word ptr es:[0x65*4],addi
mov word ptr es:[0x65*4+2],cs  


mulhook:
mov ax,0
mov es,ax
mov word ptr es:[0x65*4],mult
mov word ptr es:[0x65*4+2],cs  
   
divhook:
mov ax,0
mov es,ax
mov word ptr es:[0x65*4],divi
mov word ptr es:[0x65*4+2],cs 


main endp
.exit



; main ending




addi  proc
    
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
   
   add si,di 
   mov bx,si 
   jmp addhook
   
mult proc 
    
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
   
   mov ax,si
     mul di
     mov bx,0
     mov bl,al  
     
     jmp mulhook
    
divi proc
     
     
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
    
     mov ax,di
    mov dx,0h
    div si
     mov bx,0
     mov bl,al 
    jmp divhook     
   
   
       
    
   
   
    
    
   
   
  
   
   pop bp
   pop cx
   pop bx
   
   
   
   
   
   
   
   
   
    
    
    
      
    
    
    
    









