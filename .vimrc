" ==============vim基本配置==============
set guifont=Monospace\ 14
set nu             " 显示行号
syntax enable
syntax on
"colorscheme wombat
colorscheme elflord
set autowrite   " 自动保存

set backspace=2

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

" set cursorcolumn
set cursorline

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
    call setline(1, "\# -*-coding=utf-8-*-")
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
call vundle#begin("~/.vim/bundle/Plugins")
" let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
Plugin 'PaulHaeger/YCM-Generator'
Plugin 'scrooloose/nerdtree' " 文件浏览器
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'  " 替代taglist，taglist与nerdtree兼容不好，界面很乱
Plugin 'vim-airline/vim-airline' | Plugin 'vim-airline/vim-airline-themes' " 状态栏美化
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
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'rust-lang/rust.vim' " Rust语法高亮、格式化等
Plugin 'prabirshrestha/vim-lsp' " 代码补全、错误检查等
" Plugin 'dense-analysis/ale' " 异步语法检查和代码格式化
Plugin 'whatyouhide/vim-gotham'  " 配色方案 - gotham
Plugin 'morhetz/gruvbox'  " 配色方案 - gruvbox

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" 设置配色方案
colorscheme gruvbox

" ============== TagList==============
"设置ctags路径
if has('mac')
    let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'
elseif has('unix')
    let g:Tlist_Ctags_Cmd='/usr/bin/ctags'
endif

" "启动vim后自动打开taglist窗口
" autocmd vimenter *.cpp,*.cc,*.[ch],*.java,*.py,*.sh,*.go,*.rs TlistToggle
" map <C-y> :TlistToggle<CR>
"
" "不同时显示多个文件的tag，仅显示一个
" let g:Tlist_Show_One_File = 1
"
" "taglist为最后一个窗口时，退出vim
" let g:Tlist_Exit_OnlyWindow = 1
"
" "taglist窗口显示在右侧，缺省为左侧
" let g:Tlist_Use_Right_Window =1
"
" "设置taglist窗口大小
" "let Tlist_WinHeight = 100
" let g:Tlist_WinWidth = 40
"
" "设置taglist打开关闭的快捷键F8
" "noremap <F8> :TlistToggle<CR>
"
" "更新ctags标签文件快捷键设置
" "noremap <F6> :!ctags -R<CR>

""""""""""""""""""""""""""""""""""
" tagbar配置
""""""""""""""""""""""""""""""""""
" 启动时自动focus
let g:tagbar_autofocus=1
" 打开/关闭Tagbar快捷键
map <C-y> :TagbarToggle<CR>


" ============== NERDTree ==============
map <C-t> :NERDTreeMirror<CR>
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeSize = 50
let g:NERDTreeWinSize = 25 " NERDTree的大小

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" 不显示 .pyc 文件
let NERDTreeIgnore = ['\.pyc$']

" 启动 vim 时自动打开 NERDTree
autocmd vimenter *.cpp,*.cc,*.[ch],*.java,*.py,*.sh,*.go,*.rs NERDTree
" 只剩 NERDTree 窗口时关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==============YCM==============
" let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python3.8'
  " YCM 查找定义
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/Plugins/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let mapleader=','
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0  " 关闭函数原型提示

let g:ycm_show_diagnostics_ui = 0 " 关闭诊断信息
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2  " 两个字符触发 补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 收集
let g:ycm_complete_in_strings=1
noremap <c-z> <NOP>
let g:ycm_key_invoke_completion = '<c-z>'   " YCM 里触发语义补全有一个快捷键
let g:ycm_max_num_candidates = 15  " 候选数量
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

"YCM-Generator配置
" nnoremap <C-y> :YcmGenerateConfig ./<CR>   "更新.ycm_extra_conf.py文件
