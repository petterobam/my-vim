"  加载插件的插件提前注入
execute pathogen#infect()

" vundle 配置 {{{
set rtp+=~/.vim/bundle/vundle
"set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 在这里添加你想安装的Vim插件
"Plugin 'gmarik/Vundle.vim'
"这应该始终是第一个

Plugin 'gmarik/Vundle.vim'

" （1）从Github进行安装：
"Plugin 'user/plugin'
" （2）从http://vim-scripts.org/vim/scripts.html进行安装：
"Plugin 'plugin_name'
" （3）从另一个git软件库进行安装：
"Plugin 'git://git.another_repo.com/plugin'
" （4）从本地文件进行安装：
"Plugin 'file:///home/user/path/to/plugin'
" （5）你还可以定制其他参数，比如插件的运行时路径，如果你在自行编写插件，或者就想从不是~/.vim的另一个目录来装入它，这非常有用。
"Plugin 'rstacruz/sparkup', {'rtp': 'another_vim_path/'}
" （6）如果你有同样名称的插件，可以更名插件，那样它就不会冲突。
"Plugin 'user/plugin', {'name': 'newPlugin'}

call vundle#end()

Bundle 'gmarik/vundle'
" Python补全强力插件
Bundle 'davidhalter/jedi'
" c-family 补全插件
Bundle 'Valloric/YouCompleteMe'
" 添加引号,括号配对补全
Bundle 'jiangmiao/auto-pairs'
" 添加/解除注释
Bundle 'scrooloose/nerdcommenter'

" }}}


" 自动补全配置 {{{
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" 回车即选中当前行
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 跳转到定义处 
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

set encoding=utf-8 " Set default encoding to UTF-8
set langmenu=zh_CN.utf-8 
set ambiwidth=double " 防止特殊符号无法正常显示
" language messages zh_CN.utf-8
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" 语法高亮
syntax on

" 设置配色
set background=dark
" colorscheme solarized

" 设置字体
set guifont=Terminus:Monaco:h12

" 设置gvim启动窗口的位置，以及大小
" winpos 300 105
" set lines=30 columns=100

" 开启行号显示
set number

"下面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
"写上很有用
set autoindent
set smartindent

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

" 高亮当前行
set cursorline

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 在c,c++,python文件中用空格代替制表符
autocmd FileType c,cpp,python set shiftwidth=4 | set expandtab

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 为特定文件添加特定头部
function HeaderFile()
	if &filetype == 'sh'
		call setline(1, "\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: ouyangjie")
		call append(line(".")+2, "\# mail: 1460300366@qq.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%F %R"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
	endif
	if &filetype == 'python'
		call setline(1, "\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ouyangjie")
        call append(line(".")+2, "\# mail: 1460300366@qq.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%F %R"))
        call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/usr/bin/env python")
		call append(line(".")+6, "\# -*- coding: utf-8 -*-")
		call append(line(".")+7, "")
	endif
	if &filetype == 'cpp'
		call setline(1, "\/**")
        call append(line("."), " \* File Name: ".expand("%"))
        call append(line(".")+1, " \* Author: ouyangjie")
        call append(line(".")+2, " \* mail: 1460300366@qq.com")
        call append(line(".")+3, " \* Created Time: ".strftime("%F %R"))
        call append(line(".")+4, " \*/")
		call append(line(".")+5, "\#include<iostream>")
		call append(line(".")+6, "using namespace std;")
		call append(line(".")+7, "")
	endif
	if &filetype == 'c'
		call setline(1, "\/**")
        call append(line("."), " \* File Name: ".expand("%"))
        call append(line(".")+1, " \* Author: ouyangjie")
        call append(line(".")+2, " \* mail: 1460300366@qq.com")
        call append(line(".")+3, " \* Created Time: ".strftime("%F %R"))
        call append(line(".")+4, " \*/")
		call append(line(".")+5, "\#include<stdio.h>")
		call append(line(".")+6, "")
	endif
    " 新建文件后，自动定位到文件末尾
	normal G
    normal o
endf
" 新建文件后，调用头部字符生成
autocmd BufNewFile * call HeaderFile()

" 单行上移下移
"noremap <C-S-Up> ddP
"noremap <C-S-Down> ddp
map <S-K>  :<c-u>execute 'move -1-'. v:count1<cr>
map <S-J>  :<c-u>execute 'move +'. v:count1<cr>

" 菜单树显示隐藏切换快捷键
map <F10> :NERDTreeToggle<CR>
" 菜单树默认打开文件时候显示
autocmd VimEnter * NERDTree
" 默认光标在打开文件下面 ctrl+w+w
wincmd w
autocmd VimEnter * wincmd w
" NERDTree一些设置
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 是否忽略展示状态
let g:NERDTreeShowIgnoredStatus = 1
" git状态对应的字符
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "@",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" airline插件的状态栏样式设置 {{{
let g:airline#extensions#tabline#enabled = 1
" 设置tab键映射
nmap <tab> :bn<cr>  
let g:airline_theme='papercolor'
" let g:airline_theme='moloai'
" let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1
" powerline
set laststatus=2
set t_Co=256
" let g:Powerline_symbols='unicode'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ '
" let g:airline_symbols.paste = 'Þ '
" let g:airline_symbols.paste = '∥ '
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ '
" }}}

" 代码折叠配置
set foldenable              " 开始折叠
set foldmethod=marker       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠
" 用shift+空格键来开关折叠
nnoremap <S-space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 代码检查配置 ale-setting {{{
let g:ale_set_highlights = 0
" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 打开文件时不进行检查
let g:ale_lint_on_enter = 0
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" <Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
" <Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
" 使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\   'java': ['eslint'],
\   'css': ['stylelint'],
\}
" }}}

" delimitMate settings 
set backspace=start,eol 
let delimitMate_expand_cr = 1 " 需要backspace包含start,eol 
let delimitMate_expand_space = 1 " 需要backspace包含start,eol

" 代码补齐功能启动
let g:deoplete#enable_at_startup = 1

" 代码格式化工具配置
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
