:set shell=bash
set nocompatible
"filetype off
filetype plugin indent on

source ~/.config/nvim/conceal.vim


" Always use the system python instead of virtualenv.
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" ---- Plugins ----
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Async
Plug 'Shougo/denite.nvim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'tag': '4.0', 'do': ':UpdateRemotePlugins' }

" Async
Plug 'Shougo/vimproc.vim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" CSS
Plug 'ap/vim-css-color'

" Dependencies/utilities
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

" Formatting
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'

" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'eugen0329/vim-esearch'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Linting
Plug 'w0rp/ale'

" Python
Plug 'zchee/deoplete-jedi'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Terminal
Plug 'mklabs/split-term.vim'
Plug 'sbdchd/vim-run'

" Snippets
Plug 'SirVer/ultisnips'

" UI
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 't9md/vim-choosewin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'logico-dev/typewriter'

" Undo history
Plug 'mbbill/undotree'

 " Initialize plugin system
call plug#end()


" ---- Theme ----
set t_Co=256
set background=dark
colorscheme typewriter-night

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set laststatus=1



" ---- Airline ----
"  Always show powerline
set laststatus=2

" Get rid of the default mode indicator
set noshowmode
"
" Enanble powerline font
let g:airline_powerline_fonts = 1

" Set Airline theme
let g:airline_theme = 'typewriter'



" ---- General settings ---- "
"  Use system clipboard - paste and copy using y & p.
set clipboard=unnamed

set backupcopy=yes

" Search
set hlsearch!
set ignorecase
set smartcase

" Show line and column number.
set ruler               

" Syntax highlighting.
syntax on

" Show (partial) command in status line.
set showcmd

" Make backspaces more powerfull.
set backspace=indent,eol,start

" - Omnifunc -
aug omnicomplete
  autocmd!
  autocmd FileType css,scss,sass,stylus,less setl omnifunc=csscomplete#CompleteCSS
aug END


" ---- Formatting ---- "
" No wrapping
set nowrap

" Shows line count.
set number

" Shows relative numbers as line count.
set relativenumber

" Show cursor line
set cursorline

" Hide all GUI (scroll bars, tool bars)
set guioptions="

" Copy indent from current line when starting a new line
set autoindent

" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" " On pressing tab, insert 4 spaces
set expandtab

" Persistent undo - Remember undo history within a file.
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif



" ---- Mapping ----
" Leader mapping.
let mapleader=","

" Go to next error
nnoremap <Leader>d :lnext<CR>

" Go to prev error
nnoremap <Leader>a :lprev<CR>

" Open undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Source vimrc
nmap <Leader>sv :so ~/.config/nvim/init.vim<CR>

"" Open terminal
nmap <Leader>t :Term fish<CR>

" Run current file in python shell
nmap <Leader>p :Run python<CR>
nmap <Leader>j :Run javascript<CR>


" Turn off search highlight
map <Leader><space> :nohlsearch<CR>

" Spelling
map <Leader>s :setlocal spell spelllang=en_us<CR>

" Copy
noremap <Leader>y "*y
noremap <Leader>Y "+y

" Fuzzy search
cnoreabbrev Ack Ack!
nnoremap <Leader>A :Ack!<Space>

" Window movements
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Close quick fix window
nmap <Leader>c :cclose<CR>


" Apply prettier to current file.
map <Leader>pr 0ggvG$:'<,'> !prettier % --single-quote=True --tab-width=4 --flow-parser=True<CR>

" Tab completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



" ---- Plugin specific options ----
" - Ack.vim -
" Ignore certain files / folders in Ack search.
let g:agprg='ag -S --nocolor --nogroup --column --ignore __pycache__ --ignore node_modules --ignore virtualenv --ignore "./public/stylesheets/*"'


" - Ale -
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_sign_error = '●'

let g:ale_fixers = { 'javascript': ['eslint'], }

let g:ale_linters = {
\   'css': ['prettier'],
\   'python': ['flake8', 'pycodestyle', 'mypy'],
\   'javascript': ['eslint', 'flow'],
\   'sass': ['prettier'],
\   'scss': ['prettier'],
\}

" Ignore module level import, and line too long.
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '--ignore=E402,E501'
let g:ale_python_pycodestyle_options = '--ignore=E402,E501'


" Mypy
let g:ale_python_mypy_executable = 'mypy'
let g:ale_python_mypy_options = '--ignore-missing-imports --check-untyped-defs'
let g:ale_python_mypy_use_global = 1


" Navigate between errors.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Fix files automatically on save.
let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1


" - ChooseWin -
" Session prompt
let g:session_autoload = 'no'

" Choose Window Plugin
nmap - <Plug>(choosewin)

" Enable overlay
let g:choosewin_overlay_enable = 0


" - Goyo -
nnoremap <Leader>h :Goyo 100%x100%<CR>
nnoremap <Leader>H :Goyo!<CR>


" - CtrlSF -
nmap <Leader>f <Plug>CtrlSFPrompt


" - CtrlP -
" Ignore some folders and files for CtrlP indexing.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|virtualenv\|__pycache__\|log\|tmp$',
  \ 'file': '\.so$\|\.jpeg$\|\.jpg$\|\.png$\|\.dat$|\.DS_Store$'
  \ }


" - Deoplete -
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length=1


" - FZF - "
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>


" - NERD Commenter - "
" Add spacing in comments using NERDCommenter
let g:NERDCustomDelimiters = { 'py' : { 'left': '# ', 'leftAlt': '', 'rightAlt': '' }}


" - Prettier formatter -
autocmd FileType javascript set formatprg=prettier\ --stdin

" ---- Typescript ---- "
" Set filetypes as typescript.jsx
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx



" - UltiSnips - "
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger="<Leader>e"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"


" - Vim run - "
let g:run_cmd_python = ['python3']


" - Vim-javascript - "
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_return  = "ℛ"
let g:javascript_conceal_function = "ƒ"
