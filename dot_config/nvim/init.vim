set nocompatible
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'fatih/vim-go'
" Plug 'davidhalter/jedi-vim'
Plug 'jamessan/vim-gnupg'
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'martinda/jenkinsfile-vim-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'

" Tags
Plug 'majutsushi/tagbar'

" vim coverage
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
Plug 'google/vim-glaive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()
call glaive#Install()

Glaive coverage plugin[mappings]
Glaive coverage uncovered_text='▴▴'
Glaive coverage covered_ctermbg='darkgreen'
nnoremap <unique> <script> <silent> <Leader>ct :CoverageToggle<cr>
nnoremap <unique> <script> <silent> <F9> :CoverageToggle<cr>

" let g:deoplete#enable_at_startup = 1
" let g:jedi#completions_enabled = 0

filetype plugin indent on

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

let g:ag_working_path_mode="r"
set scrolloff=5

let g:python_host_prog = 'python'
let g:python3_host_prog = 'python'

" For javascript we need to add a space after // 
let NERDSpaceDelims=1

let g:EditorConfig_core_mode = 'external_command'

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nmap ; :Buffers<CR>
nmap <Leader>t :Tags<CR>
" nmap <Leader>r :Tags<CR>
map <leader>f :Files<CR>

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set termguicolors

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
set previewheight=20

" Emmet
let g:user_emmet_expandabbr_key='<C-a>'

" NERDCommenter
map <C-_> <leader>c<Space>

" Ale fixers
let g:ale_fix_on_save = 0

let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
" let g:ale_linters_explicit = 1

let g:javascript_jshint_executable = 'foobar'
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'html': ['prettier'],
\}
" let g:ale_javascript_prettier_options = '--single-quote --space-before-function-paren --no-semi'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_warning = '⚠'" Enable integration with airline.
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_black_executable = "/home/snelis/.pyenv/versions/home/bin/black"
let g:ale_python_black_options='--skip-string-normalization '
" let g:ale_python_isort_executable = "isort"
map <F2> :ALEFix<CR>
map <F5> :noh<CR>
map <F6> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>


" theme
set t_Co=256
set background=dark
" colorscheme gruvbox
colorscheme base16-default-dark
map <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
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
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <F3> :NERDTreeToggle<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'powerlineish'

let g:jedi#goto_command = "<leader>gd"
let g:tmux_navigator_save_on_switch = 2

" filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set cursorline
" hi CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
" hi CursorLineNr cterm=NONE ctermfg=red



" coc.nvim
" ==============================================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
