set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'janko-m/vim-test'
Plugin 'nvie/vim-flake8'
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'vito-c/jq.vim'
Plugin 'easymotion/vim-easymotion'

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

" Shortcuts
nnoremap <LEADER>jd :JavaSearch -x declarations<CR>
nnoremap <LEADER>js :JavaSearch<CR>
nnoremap <LEADER>ji :JavaImport<CR>
nnoremap <LEADER>jf :%JavaFormat<CR>
nnoremap <LEADER>t :VimuxRunCommand ""<LEFT>
nnoremap <LEADER>T :VimuxCloseRunner<CR>
nnoremap <LEADER>mr :VimuxRunCommand "mrn"<CR>

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

" Eclim config
let g:EclimJavaSearchSingleResult = 'vsplit'
let g:EclimCompletionMethod = 'omnifunc'
