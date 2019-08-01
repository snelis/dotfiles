set nocompatible
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'jamessan/vim-gnupg'
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'valloric/youcompleteme'
" Completions

Plug 'ervandew/supertab'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
"Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'jiangmiao/auto-pairs'
" Plug 'rking/ag.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'martinda/jenkinsfile-vim-syntax'
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

filetype plugin indent on

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 2

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

let g:EditorConfig_core_mode = 'external_command'

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

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
let g:user_emmet_expandabbr_key='<C-a>'

" NERDCommenter
map <C-_> <leader>c<Space>

" Ale fixers
let g:ale_fix_on_save = 0

let g:ale_sign_column_always = 1
" let g:ale_linters_explicit = 1

let g:javascript_jshint_executable = 'foobar'
let g:ale_fixers = {
\   'python': ['yapf', 'isort'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}
" let g:ale_javascript_prettier_options = '--single-quote --space-before-function-paren --no-semi'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
map <F2> :ALEFix<CR>
map <F5> :noh<CR>
map <F6> :NERDTreeFind<CR>


" theme
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
set t_Co=256
let g:solarized_termcolors=256
set background=dark
" colorscheme solarized
colorscheme wal
" hi Normal ctermbg=233
" hi LineNr ctermbg=234
" hi Normal guibg=#192224 guisp=#192224 gui=NONE ctermfg=196 ctermbg=235 cterm=NONE

" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
map <F3> :NERDTreeToggle<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline_theme = 'serene'
let g:airline_theme = 'raven'
let g:airline_theme = 'wombat'
let g:airline_theme = 'dark'
let g:airline_theme = 'term'
let g:airline_theme = 'base16color'


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
