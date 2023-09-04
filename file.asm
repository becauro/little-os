[org 0x7c00]

mov ah, 0x0e
mov bx, buf_os_message

os_message:
	mov al , [bx] 
	cmp al, 0 
	je question
	int 0x10
	inc bx 
	jmp os_message 

question:
	mov bx, buf_question	

	.loop_question:

	mov al, [bx]
	cmp al, 0
	je user_answer 
	int 0x10
	inc bx
	jmp .loop_question


user_answer:
	mov bx, buf_user_answer 

	.loop_user_answer:
	mov ax, 0
	int 0x16
	mov [bx], al		
	cmp byte [bx], 0xd
	je finish_question 
	mov ah, 0x0e
	int 0x10
	inc bx
	jmp .loop_user_answer

finish_question:

	mov ah, 0x0e 
	mov bx, buf_finish_question

	.loop_finish_question:
	
	mov al, [bx]	
	cmp al, 0 
	je end
	int 0x10
	inc bx
	jmp .loop_finish_question
end:
	jmp $
	
buf_os_message: db 0xa, "Starting the Operating System...", 0, 
buf_question: db 0xa,0xa, 0xd, "Now, type your username here [max size: 10 char] >>: ", 0
buf_user_answer: times 11 db 0
buf_finish_question: db 0xa, 0xa, 0xd, "FINISHED", 0

times 510-($-$$) db 0
db 0x055, 0x0aa
