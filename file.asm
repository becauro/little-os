[org 0x7c00]

mov ah, 0x0e
mov bx, buffer

start_os_msg:
	mov al , [bx] 
	cmp al, 0 
	je interview_msg 
	int 0x10
	inc bx 
	jmp start_os_msg 

interview_msg:
	mov bx, buf_interview	

	.loop_interview_msg:

	mov al, [bx]
	cmp al, 0
	je end
	int 0x10
	inc bx
	jmp .loop_interview_msg
end:
	jmp $
	
buffer: db 0xa, "Starting the Operating System...", 0, 
buf_interview: db 0xa,0xa, 0xd, "Now, type your name here >>: ", 0

times 510-($-$$) db 0
db 0x055, 0x0aa
