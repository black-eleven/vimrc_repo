" ==============vim基本配置==============
set guifont=Monospace\ 14
set nu             " 显示行号
syntax enable
syntax on
"colorscheme wombat
colorscheme elflord
set autowrite   " 自动保存

" 编码设置
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese,cp936
set fileencoding=utf-8
set termencoding=utf-8

" 语言设置
set langmenu=zh_CN.UTF-8

set hlsearch

" 设置自动缩进
set autoindent
set smartindent

" Tab的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 用空格代替Tab符
set expandtab

" 高亮显示匹配的括号
set showmatch
set matchtime=1

" 去掉错误提示音
set noeb

" 设置输入内容时就显示搜索结果
set incsearch

" 设置代码补全
set completeopt=preview,menu

" 设置状态栏显示内容
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l/%L,%c][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2


" 自动插入文件头
autocmd BufNewFile *.sh exec ":call SetShellTitle()"
autocmd BufNewFile *.py exec ":call SetPythonTitle()"
autocmd BufNewFile *.awk exec ":call SetAwkTitle()"

function! SetScriptTitle()
    call append(line(".")+1, "")
    call append(line(".")+2, "\##############################")
    call append(line(".")+3, "\#")
    call append(line(".")+4, "\# File Name:     ".expand("%"))
    call append(line(".")+5, "\# Author:        eleven.yi")
    call append(line(".")+6, "\# Create Time:   ".strftime("%c"))
    call append(line(".")+7, "\#")
    call append(line(".")+8, "\##############################")
    call append(line(".")+9, "")
    call append(line(".")+10, "\# Command:")
    call append(line(".")+11, "")
    call append(line(".")+12, "\# Function:")
    call append(line(".")+13, "")
    call append(line(".")+14, "\# Input:")
    call append(line(".")+15, "\#   Format:")
    call append(line(".")+16, "")
    call append(line(".")+17, "\# Output:")
    call append(line(".")+18, "\#   Format:")
    call append(line(".")+19, "")
    call append(line(".")+20, "")
endfunc


function! SetShellTitle()
    call setline(1, "\#!/bin/bash")
    call append(line("."), "")
"    call SetScriptTitle()
endfunc

function! SetPythonTitle()
    call setline(1, "\#!/home/gynnash/tools/anaconda3/bin/python")
    call append(line("."), "\# -*-coding=utf-8-*-")
"    call SetScriptTitle()
endfunc

function! SetAwkTitle()
    call setline(1, "\#!/usr/bin/awk -f")
    call append(line("."), "")
"    call SetScriptTitle()
    call append(line(".")+21, "BEGIN {")
    call append(line(".")+22, "")
    call append(line(".")+23, "")
    call append(line(".")+24, "")
    call append(line(".")+25, "}")
    call append(line(".")+26, "")
    call append(line(".")+27, "{")
    call append(line(".")+28, "")
    call append(line(".")+29, "")
    call append(line(".")+30, "")
    call append(line(".")+31, "}")
    call append(line(".")+32, "")
    call append(line(".")+33, "END {")
    call append(line(".")+34, "")
    call append(line(".")+35, "")
    call append(line(".")+36, "")
    call append(line(".")+37, "}")
endfunc


autocmd BufNewFile *.cpp,*.cc,*.[ch],*.java exec ":call SetProgTitle()"
function! SetProgTitle()
    call setline(1, "/*")
    call append(line("."), " * File Name:     ".expand("%"))
    call append(line(".")+1, " * Author:        eleven.yi")
    call append(line(".")+2, " * Create Time:   ".strftime("%F %T %A"))
    call append(line(".")+3, " */")
    call append(line(".")+4, "")
    call append(line(".")+5, "/*")
    call append(line(".")+6, " * Function:")
    call append(line(".")+7, " *")
    call append(line(".")+8, " */")
    call append(line(".")+9, "")
endfunc

autocmd BufRead *.cpp,*.cc,*.[ch],*.java,*.py,*.sh,*.awk exec ":call UpdateFileName()"
function! UpdateFileName()
    if &filetype == 'awk' || &filetype == 'sh' || &filetype == 'awk'
        if getline(6) =~ "^#"
            call setline(6, "\# File Name:     ".expand("%"))
        endif
    endif
    if &filetype == 'c' || &filetype == 'h' || &filetype == 'cc' || &filetype == 'cpp'
        if getline(1) =~ '^/\*' && getline(2) =~ '\* File Name'
            call setline(2, " * File Name:     ".expand("%"))
        endif
    endif
endfunc

autocmd BufNewFile *.awk normal 12gg
autocmd BufNewFile *.cpp,*.cc,*.[ch],*.java,*.py,*.sh normal G

set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码
set textwidth=120
set formatoptions+=t
set cindent
set smartindent
set noerrorbells
set showmatch
set nobackup
set noswapfile
" set cursorline

" remap control + arrow key to select windows
" noremap <C-Down>  <C-W>j
" noremap <C-Up>    <C-W>k
" noremap <C-Left>  <C-W>h
" noremap <C-Right> <C-W>l
" noremap <C-J> <C-W>j
" noremap <C-K> <C-W>k
" noremap <C-H> <C-W>h
" noremap <C-L> <C-W>l

" ==============Vundle插件管理==============
" Vundle manage
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'vim-airline/vim-airline' | Plugin 'vim-airline/vim-airline-themes' " Status line"
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'mbbill/undotree'
" Plugin 'gdbmgr'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'Yggdroot/indentLine' " Indentation level"
" Plugin 'bling/vim-bufferline' " Buffer line"
" Plugin 'yianwillis/vimcdoc'
" Plugin 'nelstrom/vim-visual-star-search'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'w0rp/ale'
" Plugin 'mbbill/echofunc'
" Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 
" map <C-t> :NERDTreeMirror<CR>
" map <C-t> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
" let g:NERDTreeSize = 50
" 
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDTrimTrailingWhitespace = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
