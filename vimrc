"Vundle setup and initialisation
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" End the Vundle initialization and return to normal
call vundle#end()          " required
filetype plugin indent on  " required

syntax on

" Set up a custom leader, so we actually use it
let mapleader=","
let maplocalleader=";"

set smartindent                 " Determine the correct tab level
set tabstop=4					" Set tab stops to be more manageable
set shiftwidth=4				" Set autoindent width to 4
set expandtab 					" Don't use tabs, use spaces instead
set smarttab					" Turn on smart tabbing
set switchbuf=usetab,newtab     " re-use a tab/window otherwise open a new taib

" Toggle spell checking on and off with `,s`
au FileType text,markdown,latex,tex nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb

" Autocommand rules for a few common files
au BufNewFile,BufRead *.txt,*.html,README,*.tex setlocal spell
au BufNewFile,BufRead wscript set filetype=python

au FileType go setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c

" Always start on the first line of a commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set showmode
set number

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

" Custom status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set t_Co=256

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
let g:normal_font="Monaco:h13"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>

set background=dark
silent! colorscheme Tomorrow-Night-Bright

" Customizations for vim-go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap gd <Plug>(go-def)

let g:go_fmt_command = "goimports"
