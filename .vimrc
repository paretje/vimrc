" Vim coloring as default on virtual terminals
" Apparently, Vim uses a white background as basis of the color scheme
" on xterm, although default is dark.
if !has("gui_running")
	set background=dark
else
	" Always show tab-bar in GVIM
	set showtabline=2
endif

" Syntax highlighting
syntax on
" Line numbers
set nu
" Spelling checker
set spell spelllang=nl
" Auto indent
filetype indent on
" File-type plugins
" TODO: activate per file-type?
filetype plugin on
" Search case-insensitive, unless caps are used
" TODO: enable this only for searches, not when replacing?
set ignorecase
set smartcase
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
set tags=./.ctags;$HOME
" Location of org-files
let g:org_agenda_files=['~/cloud/config/notes/*.org']
" Max number of tabs
set tabpagemax=32

" Arrow keys
" https://gist.github.com/hugoroy/5822226
" http://billodom.com/talks/vim-key-mapping.pdf
nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <C-O>gk
inoremap <down> <C-O>gj
vnoremap <up> gk
vnoremap <down> gj
noremap <M-Space> <Esc>
vnoremap > >gv
vnoremap < <gv

autocmd FileType haskell	setlocal nospell
autocmd FileType prolog		setlocal nospell
autocmd FileType matlab		setlocal nospell

autocmd FileType gitcommit	setlocal spelllang=en

autocmd FileType ruby		setlocal tabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType r		setlocal tabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType matlab		setlocal tabstop=4 shiftwidth=4 expandtab smarttab

autocmd FileType java		noremap <F5> :call JavaInsertImport()<CR>
autocmd FileType java		setlocal tags+=/usr/src/openjdk-7-source/.ctags

autocmd FileType tex		setlocal makeprg=latexmk\ -pdf\ -cd\ '%'

autocmd BufNewFile,BufRead /run/user/*/gvfs/**		setlocal directory=/tmp backupdir=/tmp
autocmd BufNewFile,BufRead /home/kevin/vcs/ugent/**	setlocal spelllang=nl
