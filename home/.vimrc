set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'
Plugin 'ervandew/supertab'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

syntax on
set mouse=a
set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set expandtab
set sm
set smarttab
set clipboard=unnamedplus
set number
set ignorecase
set smartcase
set ruler
set incsearch
set showmode
set nowrap
set noshowmode
set splitbelow
set splitright
set autoread
set noswapfile

" theme
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
map <F3> :NERDTreeToggle<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

"" YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>

" make YCM use the python version of the virtualenv to do completions
let g:ycm_python_binary_path = split(system("which python"))[0]
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-S-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-S-\> :TmuxNavigatePrevious<cr>

" filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

