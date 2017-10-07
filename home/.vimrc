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
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'posva/vim-vue'
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-pug'
"Plugin 'Yggdroot/indentLine'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

set runtimepath^=~/.vim/bundle/ctrlp.vim

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

" Emmet
let g:user_emmet_expandabbr_key='<C-d>'


" NERDCommenter
map <C-_> <leader>c<Space>

" Ale fixers
let g:ale_fixers = {
\   'python': ['yapf', 'isort'],
\   'javascript': ['eslint', 'prettier'],
\}

" let g:ale_fixers = {}
" let g:ale_fixers.python = ['yapf', 'isort']
" let g:ale_fixers.javascript = ['eslint']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
map <F2> :ALEFix<CR>


" theme
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
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

" ctrl p

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

