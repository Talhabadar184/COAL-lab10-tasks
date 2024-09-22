.model small
.stack 200h
.data
ASCII dw ?
Row dw ?
Column dw ?
 
Atribute dw ?
msg5 db "assembely ",0
.code 
main proc
    
    mov ax,@data
    mov ds,ax
    mov ax,0   
    mov es,ax
    

    
   
    
      
       
        mov word ptr es:[0x37*4],isrprocedures
        mov word ptr es:[0x37*4+2],cs   
        
        int 37h
            ex:
    .exit
              
isrprocedures proc 
    
   mov ah,0h
   int 16h  ; get the asci value of character
   sub ah,1 
   mov bl,ah
   mov ah,0h
   int 16h  ; get the asci value of character
   sub ah,1
   mov al,0
  or ax,bx
   
    
iret 
                 
                                
 isrprocedures endp                               