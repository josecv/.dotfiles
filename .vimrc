" python3 config
let g:python3_host_prog = '/Users/jose/vim-py/bin/python3.7'
set pyxversion=3
if has('python3')
  silent! python3 1
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Auto completion plugins
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Other plugins
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'bling/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'janko-m/vim-test'
Plug 'nvie/vim-flake8'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'vito-c/jq.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/bats.vim'
Plug 'w0rp/ale'
Plug 'towolf/vim-helm'
Plug 'andrewstuart/vim-kubernetes'
Plug 'fatih/vim-go'
Plug 'vim-scripts/Greplace.vim'
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'
Plug 'mustache/vim-mustache-handlebars'

call plug#end()

filetype plugin indent on
let python_highlight_all=1
syntax on

set t_Co=256
colorscheme zenburn
set nu
set hlsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
let mapleader=" "
if has("gui_macvim")
    set macmeta
endif

" Shortcuts
nnoremap <LEADER>jd :JavaSearch -x declarations<CR>
nnoremap <LEADER>js :JavaSearch<CR>
nnoremap <LEADER>ji :JavaImport<CR>
nnoremap <LEADER>jf :%JavaFormat<CR>
nnoremap <LEADER>t :VimuxRunCommand ""<LEFT>
nnoremap <LEADER>T :VimuxCloseRunner<CR>
nnoremap <LEADER>mr :VimuxRunCommand "mrn"<CR>
nnoremap <LEADER>f :ALEFix <CR>
nnoremap <C-p> :Files<CR>

" Easymotion overwin motions
map  <LEADER>f<LEADER> <Plug>(easymotion-bd-f)
nmap <LEADER>f<LEADER> <Plug>(easymotion-overwin-f)
map <LEADER>l<LEADER> <Plug>(easymotion-bd-jk)
nmap <LEADER>l<LEADER> <Plug>(easymotion-overwin-line)
map  <LEADER>w<LEADER> <Plug>(easymotion-bd-w)
nmap <LEADER>w<LEADER> <Plug>(easymotion-overwin-w)


" Useful abbreviations
cnoreabbrev ag Ack
cnoreabbrev Md Mvn docker
cnoreabbrev mcf MultipleCursorsFind

" Plugin configs
let g:vim_markdown_folding_disabled = 1
let test#strategy = "vimux"
let g:UltiSnipsExpandTrigger="<C-e>"
let g:ackprg = 'ag --vimgrep --smart-case'
let g:test#java#maventest#file_pattern = '\v^([Tt]est.*|.*[Tt]est(s|Case)?|.*IT)\.java$'
let g:ale_linters = {
            \ 'java': [],
            \ 'haskell': ['hdevtools'],
            \ 'python': ['flake8'],
            \ 'Dockerfile': ['hadolint'],
\}
let g:ale_fixers = {
\   'python': [
\       'yapf', 'isort'
\   ],
\}
let g:ale_virtualenv_dir_names = ['.venv']
let g:vikube_use_current_namespace = 1
let g:jedi#show_call_signatures = "0"

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/vim-py/bin/pyls'],
    \ }

" Eclim config
let g:EclimJavaSearchSingleResult = 'vsplit'
let g:EclimCompletionMethod = 'omnifunc'

highlight ColorColumn ctermbg=blue

" FileTypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType hbs setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal colorcolumn=79
autocmd FileType python EclimDisable
