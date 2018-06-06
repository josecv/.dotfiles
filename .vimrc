set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'janko-m/vim-test'
Plugin 'nvie/vim-flake8'
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'vito-c/jq.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/bats.vim'
Plugin 'w0rp/ale'
Plugin 'towolf/vim-helm'
Plugin 'andrewstuart/vim-kubernetes'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/Greplace.vim'

Plugin 'SirVer/ultisnips'

set rtp+=/usr/local/Cellar/fzf/0.17.3
Plugin 'junegunn/fzf.vim'

call vundle#end()
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
let test#strategy = "vimux"
let g:UltiSnipsExpandTrigger="<C-e>"
let g:ycm_key_list_stop_completion = ['<C-y>', '<ENTER>']
let g:ackprg = 'ag --vimgrep --smart-case'
let g:test#java#maventest#file_pattern = '\v^([Tt]est.*|.*[Tt]est(s|Case)?|.*IT)\.java$'
let g:ale_linters = {
            \ 'java': [],
            \ 'haskell': ['hdevtools'],
            \ 'python': ['pylint'],
\}

" Eclim config
let g:EclimJavaSearchSingleResult = 'vsplit'
let g:EclimCompletionMethod = 'omnifunc'

" FileTypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
