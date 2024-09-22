.model small
.stack 200h
.data
msg1 db 10,13,"enter ur choice $"
msg2 db 10,13,"enter first value $" 
msg3 db 10,13,"enter second value $"

.code 
main proc
    
    mov ax,@data
    mov ds,ax
    mov ax,0   
    mov es,ax
  mov ah,0x9
    int 21h  
     mov ah,0x1
    int 21h    
    sub al,30h
    mov bx,0
    mov bl,al 
    
    mov ah,0x9
    mov dx,offset msg2
    int 21h   
    mov ah,0x1
    int 21h
    sub al,30h
    mov ah,0
    mov si,ax
    
    mov ah,0x9
    mov dx,offset msg3
    int 21h   
    mov ah,0x1
    int 21h
    sub al,30h 
    mov ah,0
    mov di,ax
    
   
    
      
       
        mov word ptr es:[0x65*4],isrprocedures
        mov word ptr es:[0x65*4+2],cs   
        
        int 65h
       
    .exit
              
isrprocedures proc 
    
   
    cmp bx,1 
    jne second
    add si,di
    mov bx,si  
    iret
    second:
    cmp bx,2
    jne third
    mov ax,si
    mov bx,di
    mul bx
    mov bx,ax
    iret
    third:     
    mov bx,0 
    mov dx,0
    mov ax,si
    mov bx,di
    div bx  
    mov bx,ax
    
iret 
                 
                                
 isrprocedures endp                               