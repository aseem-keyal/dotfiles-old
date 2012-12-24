set nu
set autoindent
map <MiddleMouse> <Nop>
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
filetype plugin on
au BufNewFile,BufRead *.as set filetype=actionscript 
colorscheme solarized
set background=dark
for prefix in ['n', 'v']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor
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
set nocompatible
set encoding=utf-8
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
