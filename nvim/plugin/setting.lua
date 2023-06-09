vim.cmd([[
" 色彩
set termguicolors

"行号
set nu

"相对行号
set relativenumber
set sidescroll=1

"tab缩进
set tabstop=4
set shiftwidth=4


" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

"鼠标
set mouse+=a

" y复制到mac里
set clipboard+=unnamedplus

" 二进制
set binary

"搜索高亮
set hlsearch

"语法高亮
syntax on
set redrawtime=10000

" 检测文件类型
filetype on

"自动对齐
autocmd FileType * setlocal autoindent
autocmd FileType * set formatoptions-=ro

" 将制表符扩展为空格
autocmd FileType * set expandtab

"显示匹配
set showmatch

"括号高亮关掉
let loaded_matchparen=0

"忽略大小写查找
set ic
set smartcase

"右下标尺
set ruler

"显示输入的命令
set showcmd

" 帮助语言首选
set helplang=cn

" 菜单使用的语言
set langmenu=zh_CN.UTF-8

" 编码
set encoding=UTF-8

" 设置当文件被改动时自动载入
set autoread

set completeopt=menu,menuone,noselect,noinsert

let g:netrw_browse_split = 3

"检查更新时间
set updatetime=200

set laststatus=3

set splitkeep = "screen"
]])
