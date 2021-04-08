" Plugin section

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" Current colorscheme
Plug 'habamax/vim-saturnite'
" Allows sending text to other windows
Plug 'jpalardy/vim-slime'
" Latex support in vim
Plug 'lervag/vimtex'
" YouCompleteMe autocomplete
Plug 'Valloric/YouCompleteMe'
" ultisnips engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Vim Autosave
Plug 'vim-scripts/vim-auto-save'

Plug 'pearofducks/ansible-vim'

call plug#end()

" Colors section
colorscheme saturnite

" Vim Settings
set nocompatible
filetype on
filetype indent on
set updatetime=100
filetype plugin on
filetype plugin indent on
" Makes vim resize more comp. with i3wm
autocmd VimResized * wincmd =
set encoding=utf-8
set number
set relativenumber
set splitright
set splitbelow
set t_Co=256



filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" Define where slime sends output
let g:slime_target = "neovim"

" Define leader key
let mapleader= ","
let maplocalleader= "-"

"let g:netrw_liststyle=3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 2

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


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
"let g:vmtex_compiler_latexmk = {
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

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']


" Remaps
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
noremap  tn  :tabnew<CR>
nnoremap  <leader>q   :Explore<CR>


" Disable scratchbar
set completeopt-=preview


" Spell check
" Fix mistake
noremap <Leader>f z= 
" Add to dict
noremap <Leader>a zg
" Next mistake
noremap <Leader>n ]s
" Enable check
nnoremap <Leader>sp :set spell spelllang=en_us<CR>
" Quick edit
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Ultisnips
let g:UltiSnipsSnippetsDir = "~/.config/nvim/myUltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<Leader>e'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Screenshot
 let @s=':read! screenshot.sh %'
" Leader commands


" Edit type commands
nnoremap <Leader>fe :vsp ~/.config/nvim/after/ftplugin/%:e.vim<CR> 

" Open h file matching cpp file
nnoremap <Leader>h :vsp %:p:r.h <CR>

 
" Yank visual to clipboard
vnoremap <Leader>y :w !xclip -selection clipboard<CR><CR>


" Allow easy normal mode from terminal
tnoremap <Esc> <C-\><C-n>

" Open git gui in working dir
nnoremap <Leader>g :!git gui & <CR>i
