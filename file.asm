[org 0x7c00]

mov ah, 0x0e
mov bx, buffer

loop:

	mov al , [bx] 
	cmp al, 0 
	je end 
	int 0x10
	inc bx 
	jmp loop 

end:
	jmp $


buffer: db 0xa, "Starting the Operating System...", 0

times 510-($-$$) db 0
db 0x055, 0x0aa
