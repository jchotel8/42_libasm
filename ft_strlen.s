global _ft_strlen

_ft_strlen:
		mov	rax, -1

loop:
		inc	rax					; hey
		mov cl, [rdi + rax]
		cmp	cl, 0				; si égaux alors c = 0,
		jne	loop				; !c = 1 alors on recommence,

return:
		ret
