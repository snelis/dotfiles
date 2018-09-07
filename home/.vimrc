set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'jamessan/vim-gnupg'
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
" Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'martinda/jenkinsfile-vim-syntax'
call vundle#end()
filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

let g:ag_working_path_mode="r"
set scrolloff=5

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" For javascript we need to add a space after // 
let NERDSpaceDelims=1

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Vim diff
nnoremap <leader>dg2 :diffget //2<cr>
nnoremap <leader>dg3 :diffget //3<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set undodir=~/.local/share/nvim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer
set diffopt+=vertical

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
let g:user_emmet_expandabbr_key='<C-S-d>'

" NERDCommenter
map <C-_> <leader>c<Space>

" Ale fixers
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\   'python': ['yapf', 'isort'],
\   'javascript': ['eslint', 'prettier_standard'],
\   'vue': ['eslint'],
\}
" let g:ale_javascript_prettier_options = '--single-quote --space-before-function-paren --no-semi'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
map <F2> :ALEFix<CR>
map <F5> :noh<CR>


" theme
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
hi Normal ctermbg=233
hi LineNr ctermbg=234

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

"SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" tmux-navigator
" let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

" nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-S-Left> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-S-Down> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-S-Up> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-S-Right> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-S-\> :TmuxNavigatePrevious<cr>

let g:SuperTabMappingForward = '<tab>'

" filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
