"------------------------------------------------------------
" Vundle plugin manager 

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Installed plugins 

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

"------------------------------------------------------------
" Features 


" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
 
" Enable syntax highlighting
syntax on

" Enable line highlighting
:set cursorline
 
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatically enable auto-complete for HTML files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Automatically open NERDTree
autocmd vimenter * NERDTree

" Automatically close vim when NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use case insensitive search, except when using capital letters
"------------------------------------------------------------
" Must have options
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-n> to temporarily turn off highlighting; see the
" mapping of <C-n> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
"------------------------------------------------------------
" Mappings {{{1 "
" Useful mappings
 
" Toggle NERDTree
nmap <S-n> :NERDTreeToggle<CR>

" Easier moving between splits
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" Rebin <Leader> key
let mapleader = ","
 
" Easier moving between tabs with ,+n or ,+m 
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Bind nohl
" Removes highlight of your last search
nnoremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" map sort function to ,+s (good for sorting python imports
vnoremap <Leader>s :sort<CR>

" easier moving (indentation) of code blocks
vnoremap < <gv
vnoremap > >gv

" Quick quit command with ,+e
noremap <Leader>e :quit<CR> "Quit current window

 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
set ignorecase
set smartcase
set incsearch
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Mouse and backspace 
set mouse=a
set bs=2 

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left and show relative numbers from current line
set number
set relativenumber

" Show line Length
set tw=95   " width of document
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed 

" Useful settings
set history=700
set undolevels=700
 
" For status bar
set laststatus=2

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
"------------------------------------------------------------
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('cpp', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('html', 'magenta', 'none', 'magenta', '#151515')
call NERDTreeHighlightFile('css', 'magenta', 'none', 'magenta', '#151515')

