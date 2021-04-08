function! SlimeSectionSend()
	let cl=getcurpos()
	execute "?^%%"
	let ul=getcurpos()
	execute "/^%%"
	let ll=getcurpos()
	call setpos('.',cl)
	execute ul[1].",".ll[1]."SlimeSend"
endfunction
command -bar SlimeSectionSend call SlimeSectionSend()
nmap <C-c><C-c> :SlimeSectionSend<CR>
