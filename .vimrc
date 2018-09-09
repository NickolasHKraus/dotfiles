" ~~~~~~~~~~~~~~~~~~~~~~~~~ Start Vundle configuration ~~~~~~~~~~~~~~~~~~~~~~~~

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nvie/vim-flake8'
Plugin 'pseewald/vim-anyfold'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/vitality.vim'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ~~~~~~~~~~~~~~~~~~~~~~~~~~ Start Vim configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

" set color scheme
colorscheme slate

" enable syntax highlighting
syntax on

" vertical split (:split, :sp) below current pane
set splitbelow

" horizontal split (:vsplit, :vs) right of current pane
set splitright

" show line numbers
set number

" tab width set to 2
set tabstop=2

" indents will have width of 2
set shiftwidth=2

" expand tabs to spaces
set expandtab

" enable 256-bit color
set t_Co=256

" always display status line
set laststatus=2

" hide mode
set noshowmode

" show vertical column at 80th character for ['*.py']
au BufReadPost,BufNewFile *.py set colorcolumn=80

" set vertical column color to black
highlight ColorColumn ctermbg=darkgray

" set spell check language
set spelllang=en_us

" set spell check file
set spellfile=$HOME/.vim/en.utf-8.add

" enable spellcheck for ['markdown', 'git']
autocmd FileType markdown setlocal spell
autocmd FileType git setlocal spell

" automatically remove trailing whitespace before write
autocmd BufWritePre * %s/\s\+$//e

" enable normal backspace behavior
set backspace=indent,eol,start

" set pmenu (pop-up menu) color
highlight Pmenu ctermfg=gray ctermbg=darkgray

" auto save all files when focus is lost or when switching buffers
autocmd FocusLost,BufLeave * :wa


" ~~~~~~~~~~~~~~~~~~~~~~~ Start Vim remap configuration ~~~~~~~~~~~~~~~~~~~~~~~

" remap pane selection to ^Ctrl + [JKLH]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~ Start fzf configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

" if installed using Homebrew
set rtp+=/usr/local/opt/fzf"

" this is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" map :FZF to ^Ctrl + o
map <C-o> :FZF<CR>


" ~~~~~~~~~~~~~~~~~~~~~~~ Start Powerline configuration ~~~~~~~~~~~~~~~~~~~~~~~

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup


" ~~~~~~~~~~~~~~~~~~~~~ Start vim-autoformat configuration ~~~~~~~~~~~~~~~~~~~~

" disable autoformat fallback behavior for file types: ['gitcommit']
autocmd FileType gitcommit let b:autoformat_autoindent=0
autocmd FileType gitcommit let g:autoformat_retab = 0
autocmd FileType gitcommit let g:autoformat_remove_trailing_spaces = 0


" ~~~~~~~~~~~~~~~~~~~~~~ Start YouCompleteMe configuration ~~~~~~~~~~~~~~~~~~~~

" close preview window after completion
let g:ycm_autoclose_preview_window_after_completion=1

" map GoToDefinitionElseDeclaration to <leader>('\') + g
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


" ~~~~~~~~~~~~~~~~~~~~~~ Start vim-anyfold configuration ~~~~~~~~~~~~~~~~~~~~~~

let anyfold_activate=1
set foldlevel=99

" remap code block folding/unfolding to <space>
nnoremap <space> za


" ~~~~~~~~~~~~~~~~~~~~~~~~ Start nerdtree configuration ~~~~~~~~~~~~~~~~~~~~~~~

" map toggle NERDTree to ^Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" show hidden files by default
let NERDTreeShowHidden=1

" ignore specifc files
let NERDTreeIgnore=['\.pyc$', '\~$']


" ~~~~~~~~~~~~~~~~~~~~~~~ Start syntastic configuration ~~~~~~~~~~~~~~~~~~~~~~~

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ~~~~~~~~~~~~~~~~~~~~~~~~~ Start Python configuration ~~~~~~~~~~~~~~~~~~~~~~~~

" set Python indentation
autocmd BufNewFile,BufRead *.py:
      \ set autoindent
      \ set expandtab
      \ set fileformat=unix
      \ set shiftwidth=4
      \ set softtabstop=4
      \ set tabstop=4
      \ set textwidth=79

" set encoding
set encoding=utf-8
