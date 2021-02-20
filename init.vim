 call plug#begin('~/.local/share/nvim/site/autoload/plug.vim')
   
"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
   
call plug#begin('~/.config/nvim/plugged')
  
"plugins here, coc for example
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  
inoremap <silent><expr> <C-space> coc#refresh()
  
"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
  
nmap <leader>rn <Plug>(coc-rename)
  
 "show all diagnostics.
 nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
 "manage extensions.
 nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
  
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction 

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map ; :Files<CR>

Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()
let g:python3_host_prog = '/usr/bin/python3.9'
let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]


set number
syntax on
colorscheme industry
set tabstop=2
set autoindent
set expandtab
set softtabstop=2

" Latex setup
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:vimtex_view_automatic=0
"let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal='abdmg'
" Set default latex type
let g:tex_flavor = "latex"
" Disable warnings about missing clientserver, since none is available
"let g:vimtex_compiler_latexmk = {'callback' : 0}
"let g:vimtex_compiler_latexmk = {
"    \ 'options' : [
"    \   '-pdf',
"    \   '-shell-escape',
"    \   '-verbose',
"    \   '-file-line-error',
"    \   '-synctex=0',
"    \   '-interaction=nonstopmode',
"    \ ],
"    \}

let g:vimtex_compiler_latexmk = {
		\ 'executable' : 'latexmk',
		\ 'callback' : 0,
    \ 'options' : [
    \   '-pdflualatex="lualatex -shell-escape %O %S"',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-f',
    \ ],
    \}

