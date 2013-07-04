" Aseem's Vimrc file
" ============================================================================

" Automaticly reload config ----------------------------------------------- {{{

autocmd! bufwritepost vimrc source %

" }}}

" Setup ------------------------------------------------------------------- {{{

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set nocompatible

" }}}

"  Basic Options --------------------------------------------------------- {{{

set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set novisualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set cpoptions+=J
set shell=/bin/zsh
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set title
set dictionary=/usr/share/dict/words
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
let mapleader = ","
set tw=79
set fo-=t
set colorcolumn=80
set nobackup
set noswapfile

" }}}

" Movement ---------------------------------------------------------------- {{{

for prefix in ['n', 'v', 'i']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
let g:EasyMotion_grouping = 2

" }}}

" Editing ----------------------------------------------------------------- {{{

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
vnoremap <Leader>s :sort<CR>
nnoremap ; :<c-u>call SkyBison("")<cr>
inoremap jk <Esc>
inoremap kj <Esc>

" }}}

" Saving and Quiting ------------------------------------------------------ {{{

noremap <Leader>w :update<CR>
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" }}}

" Trailing Whitespace ----------------------------------------------------- {{{

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" Colorscheme ------------------------------------------------------------- {{{

syntax on
colorscheme default
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif
set t_Co=256
highlight ColorColumn ctermbg=8

" }}}

" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0
nnoremap <Space> za
vnoremap <Space> za
nnoremap <leader>z zMzvzz
set foldmethod=marker
set nofoldenable

" }}}

" Powerline --------------------------------------------------------------- {{{

let g:Powerline_symbols = 'fancy'

" }}}

" Searching --------------------------------------------------------------- {{{

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" }}}

" Ctrl-P ------------------------------------------------------------------ {{{

let g:ctrlp_max_height = 30

" }}}

" Python ------------------------------------------------------------------ {{{

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" }}}

" Actionscript ------------------------------------------------------------ {{{

au BufNewFile,BufRead *.as set filetype=actionscript

" }}}


" CoffeeScript -------------------------------------------------------------- {{{

au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" }}}

" Completion -------------------------------------------------------------- {{{

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" }}}
