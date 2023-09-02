;bits 64 

global assembly

assembly:
	mov eax, 555 
       	jmp .end 

        mov eax, 333 

.end:
	add eax, 2
	ret




times 510-($-$$) db 0
db 0x055, 0x0aa
