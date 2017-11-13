""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""
""                 _
""        __   __ (_)  _ __ ____
""        \ \ / / | | |  _   _  \
""         \ V /  | | | | | | | |
""          \_/   |_| |_| |_| |_|
""
""
"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""

"Vim{{{{ 
"   map映射
"   map前的n、v、nore、un等表示下列含义：
"       nore—— 表示非递归。
"       n ——表示在普通模式下生效。
"       v ——表示在可视模式下生效。
"       i ——表示在插入模式下生效。
"       c——表示在命令行模式下生效。
"       un——后面跟按键组合，表示删除这个映射。
"       clear——表示清除相关模式下的所有映射。
"--------------------------------------------------------------
" Vim快捷键记录
"   
"   折叠代码(Normal)：
"       折叠{}内: zf%
"       折叠到86行：zf86G
"       空格键
"
"   
"   多行锁进(Visul)：
"       选择多行，按ctrl+v进入visul模式，用>或<缩进或缩出（shift+,)
"--------------------------------------------------------------
"
" }}}}

"Plugins {{{{

    set nocompatible
    filetype plugin indent on 

    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    "set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()

    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
"}}}}


"######Vim appearance && Fonts & colors#####{{{{


    set langmenu=zh_CN.UTF-8 "语言设置
    set guifont=Monaco:h16:cANSI    
    set termencoding=utf-8  " 该选项代表输出到客户终端（Term）采用的编码类型
    set encoding=utf8 " 该选项使用于缓冲的文本(你正在编辑的文件)，寄存器，Vim 脚本文件等等
    set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030  " 该选项是vim写入文件时采用的编码类型
       
   let s = strftime('%X') 

   syntax enable
   if s>6&&s<17
      set background=light
      set lines=999 columns=999
   else
      set background=dark
   endif

    colorscheme solarized

    let g:solarized_termcolors=256



"}}}}


"#### 实用设置 ## ##{{{{

  " 显示中文帮助{{{
    if version >= 603
        set helplang=cn
        set encoding=utf-8
   endif
  "}}}


 
  "新建文件或者新打开文件自动识别文件格式{{{
    au BufRead,BufNewFile *.java   set filetype=java
    au BufRead,BufNewFile *.c   set filetype=c
    au BufRead,BufNewFile *.cpp   set filetype=cpp
    au BufRead,BufNewFile *.md   set filetype=md
    au BufRead,BufNewFile *.go   set filetype=go
    au BufRead,BufNewFile *.js   set filetype=javascript
    au BufRead,BufNewFile *.h   set filetype=cpp
    au BufRead,BufNewFile *.sh   set filetype=sh
    au BufRead,BufNewFile *.rb   set filetype=ruby
    au BufRead,BufNewFile *.py   set filetype=python
    au BufRead,BufNewFile *.{html}   set filetype=html
    au BufRead,BufNewFile *.jsp   set filetype=jsp
    "}}}



    "Tab键的设置{{{
    set tabstop=4 " Tab键的宽度,设置tab宽度为四个空格
    set expandtab " 编辑时将所有 Tab 替换为空格
    set smarttab "按一下Backspace就删除之前将所有 Tab 替换为空格的4个空格了
    set cindent " Tab键的宽度

    "}}}
    
    "缩进{{{
    set sw=4 "自动缩进的时候，缩进尺寸为 4 个空格
    set autoindent " 自动缩进
    set softtabstop=4 " 统一缩进为4
    "}}}

    "自动保存折叠码{{{
    "set foldmethod=indent
    set foldmethod=marker
    set foldenable " 开始折叠
    set foldcolumn=0 " 设置折叠区域的宽度
    setlocal foldlevel=20 " 设置折叠层数为
    "set foldclose=all " 设置为自动关闭折叠
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   " 用空格键来开关折叠
    au BufWinLeave *.* silent mkview  "records settings
    au BufWinEnter *.* silent loadview "reloads settings

    "}}}


    "查找，搜索{{{
    set ignorecase "搜索忽略大小写

    set hlsearch "搜索逐字符高亮
    
    set incsearch 
    "}}} 

    
      "鼠标，光标{{{

    set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
    set selection=inclusive " 指定在选择文本时，光标所在位置也属于被选中的范围
    set mouse=a "打开鼠标功能,缺省值为空，即不使用鼠标;n:普通模式,v:可视模式,i:插入模式,c:命令行模式,h:在帮助文件里
    "取消光标闪烁
    "set novisualbell
    
    "set cursorline    "or set cul 设置光标所在的行
    "set cursorcolumn  "or set cuc 设置光标所在的列
    au WinLeave * set nocursorline nocursorcolumn
	au WinEnter * set cursorline cursorcolumn

    "}}}

    
 "其他设置{{{

    set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  

    set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

    set noeb " 去掉输入错误的提示声音
    
    syntax on " 打开关键字上色
     
     
    set number " 显示行号

    set cmdheight=2 " 总是显示状态行
    set showcmd         " 输入的命令显示出来，看的清楚些  

    "粘贴时保持格式
    set paste
    
    set ruler           " 显示标尺  

    set lbr " 不在单词中间断行

    set fo+=mB " 打开断行模块对亚洲语言支持

    set sm   "显示括号配对情况,自动匹配括号，大括号，中括号,编程时用
    


    set linespace=0 " 增强模式中的命令行自动完成操作

    set backspace=2 " 允许backspace和光标键跨越行边界  

    "允许区域选择
    set selection=exclusive
    set selectmode=mouse,key  


    set history=1000 " 历史记录数 
    set viminfo+=! " 保存全局变量
    set iskeyword+=.,_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
    set clipboard+=unnamed "共享剪贴板 


    set autowrite "自动保存
    set autoread " 设置当文件被改动时自动载入
    set autochdir  " 自动切换当前目录为当前文件所在的目录 


    set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过

    set showmatch " 高亮显示匹配的括号
    set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）


    
     """}}}
   

"}}}

"##### Keymaps ######{{{{
    
    "<Leader>默认是\;要在定义一个映射时不在命令行上回显该映射，可以使用 "<silent>" 作为第一个参数
    "let mapleader = "." "修改leader默认值

    " 让配置变更立即生效  
    "autocmd BufWritePost $MYVIMRC source $MYVIMRC 

    "切换Buffer窗口
    imap <S-Left> <ESC>:bp<cr> i
    imap <S-Right> <ESC>:bn<cr> i
    map <S-Left> :bp<cr> 
    map <S-Right> :bn<cr> 

    "分割屏幕
    map <Leader>s <Esc>:sp<cr>
    map <Leader>v <Esc>:vsp<cr>

    " imap <C-s> <Esc>:w<cr> 与大写S冲突  
    map <S-c> yy 
    map <S-v> p
    map <S-x> dd
    map <Leader>w <ESC>:w<cr>
    map <Leader>q <Esc>:wq<cr>
 

"}}}}

"##### Functions ######{{{{

    """"""新建.c,.h,.sh,.java文件，自动插入文件头 """"""""""""""""""""{{{

    autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 

    ""定义函数SetTitle，自动插入文件头 

    func SetTitle() 
        "如果文件类型为.sh文件 
        if &filetype == 'sh' 
            call setline(1,"\#!/bin/bash") 
            call append(line("."), "") 
        elseif &filetype == 'python'
            call setline(1,"#!/usr/bin/env python")
            call append(line("."),"# coding=utf-8")
            call append(line(".")+1, "") 

        elseif &filetype == 'ruby'
            call setline(1,"#!/usr/bin/env ruby")
            call append(line("."),"# encoding: utf-8")
            call append(line(".")+1, "")
        elseif &filetype == 'jsp'
            call setline(1,"<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>")
            call append(line(".","<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">"))
            call append(line(".")+1,""))
        else
            call setline(1, "/*") 
            call append(line("."), "*	> File Name: ".expand("%")) 
            call append(line(".")+1, "*	> Author: ProZoom") 
            call append(line(".")+2, "*	> Mail: liyang_android@163.com") 
            call append(line(".")+3, "*	> Created Time: ".strftime("%c")) 
            call append(line(".")+4, " */") 
            call append(line(".")+5, "")
        endif


        if expand("%:e") == 'cpp'
            call append(line(".")+6, "#include<iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        endif


        if &filetype == 'c'
            call append(line(".")+6, "#include<stdio.h>")
            call append(line(".")+7, "")
        endif


        if expand("%:e") == 'h'
            call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
            call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
            call append(line(".")+8, "#endif")
        endif


        if &filetype == 'java'
            call append(line(".")+6,"public class ".expand("%:r")."{")
            call append(line(".")+7,"")

            call append(line(".")+8,"}")
        endif

        "新建文件后，自动定位到文件末尾

    endfunc 

    autocmd BufNewFile * normal G


    """""""""""""""""""""""""}}}
   
   
    """""""定义FormartSrc(),代码格式优化""""""""""{{{

    map <leader>f :call FormartSrc()<CR><CR>

    func FormartSrc()
        exec "w"
        if &filetype == 'c'
            exec "!astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'cpp' || &filetype == 'hpp'
            exec "r !astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'perl'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'py'||&filetype == 'python'
            exec "r !autopep8 -i --aggressive % & rm %.orig"
        elseif &filetype == 'java'
            exec "!astyle --style=java --suffix=none % & rm %.orig"
        elseif &filetype == 'jsp'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'xml'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        else
            exec "normal gg=G"
            return
        endif
        exec "e! %"
    endfunc

    """"""}}}


    """"""" C，C++ 按F5编译运行,F8调试 """"""""{{{

    map <F5> :call CompileRunGcc()<CR>

    map <F8> :call Rungdb()<CR>

    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -std=c++11 -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java' 
            exec "!javac %" 
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python3.6 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
            "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

    func! Rungdb()
        exec "w"
        exec "!g++ % -std=c++11 -g -o %<"
        exec "!gdb ./%<"
    endfunc
    """"""}}}


"}}}}



