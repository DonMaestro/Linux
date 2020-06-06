" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" My config
"

"Yank into all these at once:
"     vim y/p register
"     wayland primary
"     wayland clipboard
xnoremap y y:call system("wl-copy", @")<cr>

set hidden
set splitbelow

"set wrap linebreak nolist textwidth=0 wrapmargin=0
"colorscheme elflord default ron torte
"colorscheme default
set number

set wildmode=list:longest

"set shiftwidth=4      " Set shift width to 4 spaces.
"set tabstop=4         " Set tab width to 4 columns.
"set expandtab         " Use space characters instead of tabs.

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set ttyfast
set mouse=a
set scrolloff=3

"set term=xterm-256color
if $TERM == 'alacritty' || $TERM == 'foot'
  set ttymouse=sgr
endif

"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz
"let skip_defaults_vim=1

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" search
set incsearch

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" https://github.com/junegunn/vim-plug 
if empty(glob('~/.vim/autoload/plug.vim')) "if vim-plug isn't installed
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "create directory
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" https://github.com/vim-airline/vim-airline
"Plug 'vim-airline/vim-airline'

" https://github.com/shime/livedown
Plug 'shime/vim-livedown'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

" https://github.com/vim-syntastic/syntastic#installation
"Plug 'vim-syntastic/syntastic'

" https://github.com/vhda/verilog_systemverilog.vim
"Plug 'vhda/verilog_systemverilog.vim'

call plug#end()
" endPlugins

" Livedown Plugin
"should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 1
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use, can also be firefox, chrome or other, depending on your executable
"let g:livedown_browser = "firefox"



highlight TabLine     term=reverse cterm=none
highlight TabLineSel  term=bold    cterm=bold
highlight TabLineFill term=reverse cterm=none
"status line
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#PmenuSel#
"set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c%V

set noruler
set laststatus=0
set showcmd
let s:hidden_all = 1
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		"set noshowmode
		"set noruler
		set laststatus=0
		"set noshowcmd
	else
		let s:hidden_all = 0
		"set showmode
		"set ruler
		set laststatus=2
		"set showcmd
	endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

