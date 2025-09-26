"leader键
let mapleader = " "
"行号
set nu
"相对行号
set relativenumber

"色彩
" if exists('+termguicolors')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
" endif

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

"鼠标
set mouse+=a

" y复制到mac里
set clipboard=unnamed
"删除模式
set backspace=2

"不默认产生副本
set nobackup

set binary

"搜索高亮
set hlsearch

" 禁止折行
"set nowrap
" 折叠
" set foldmethod=marker

"语法高亮
syntax on
set redrawtime=10000

" 检测文件类型
filetype on

autocmd FileType * setlocal autoindent
filetype indent on
" 将制表符扩展为空格
set expandtab
"tab缩进
set tabstop=4
set shiftwidth=4

"显示匹配
" set showmatch
"括号高亮关掉
let loaded_matchparen=0
"忽略大小写查找
set ic

"补全
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i

"cmdline
set wildmenu
set wildoptions=pum

"右下标尺
set ruler

"显示输入的命令
set showcmd

" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8

" 设置当文件被改动时自动载入
set autoread
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'preservim/nerdtree'
map <F2> :NERDTreeToggle<CR>
"窗口大小
let NERDTreeWinSize=35

"窗口位置
let NERDTreeWinPos='left'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline-themes'

Plug 'Chiel92/vim-autoformat'

Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdcommenter'

"彩虹括号
" Plug 'luochen1990/rainbow'

Plug 'ap/vim-css-color'

"fzf搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"翻译
Plug 'voldikss/vim-translator'

"colors
Plug 'morhetz/gruvbox'

call plug#end()

"gruvbox
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_transparent_bg = 1
" colorscheme gruvbox


"rainbow 括号
"let g:rainbow_active = 1

"git检查更新时间
set updatetime=500
nmap <S-d> :Gvdiffsplit<CR>

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"永远显示状态栏
set laststatus=2
let g:airline_theme='gruvbox'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0 
let g:airline_section_c_only_filename = 1
"使用 powerline 外观
let g:airline_powerline_fonts = 1

"目录收藏默认打开
let NERDTreeShowBookmarks=1
" 删除文件时自动删除文件对应 buffer
"let NERDTreeAutoDeleteBuffer=1

noremap <leader>ff :<C-U><C-R>=printf("Files")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("History")<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("BTags")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("BLines")<CR><CR>
noremap <leader>rg :<C-U><C-R>=printf("Rg %s", expand("<cword>"))<CR>
noremap <leader>fg :<C-U><C-R>=printf("Rg"))<CR>

" 语法检查
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

" 注释的时候自动加个空格,
let g:NERDSpaceDelims=1
"删除注释尾部空格 
let g:NERDTrimTrailingWhitespace = 1

"翻译
let g:translator_default_engines = ['bing','google']

"fzf
noremap <leader>ff :<C-U><C-R>=printf("Files")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("History")<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("BTags")<CR><CR>
noremap <leader>fb :<C-U><C-R>=printf("Buffers")<CR><CR>
noremap <leader>rg :<C-U><C-R>=printf("Rg")<CR><CR>
noremap <leader>fg :<C-U><C-R>=printf("Rg %s", expand("<cword>"))<CR><CR>

"lsp
noremap <leader>fd :<C-U><C-R>=printf("LspDefinition")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("LspReferences")<CR><CR>
noremap <leader>fi :<C-U><C-R>=printf("LspImplementation")<CR><CR>
noremap <leader>fe :<C-U><C-R>=printf("LspDocumentDiagnostics")<CR><CR>
noremap <leader>fh :<C-U><C-R>=printf("LspHover")<CR><CR>
"let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
if executable('intelephense')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->['intelephense']},
        \ 'allowlist': ['php','phtml'],
        \ })
endif
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
endif

"补全
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" 自定义快捷键
noremap <leader>fw :<C-U><C-R>=printf("/%s\\C", expand("<cword>"))<CR><CR>
noremap <leader>nh :<C-U><C-R>=printf("noh")<CR><CR>
noremap <C-s> :<C-U><C-R>=printf("w")<CR><CR>
noremap <C-q> :<C-U><C-R>=printf("q")<CR><CR>
noremap <C-x> :<C-U><C-R>=printf("bd")<CR><CR>
noremap <C-h> :<C-U><C-R>=printf("bp")<CR><CR>
noremap <C-l> :<C-U><C-R>=printf("bn")<CR><CR>
nmap w] :resize +2<CR>
nmap w[ :resize -2<CR>
nmap w- :vertical resize -2<CR>
nmap w= :vertical resize +2<CR>
noremap <expr> <C-k> empty(filter(getwininfo(), 'v:val.loclist')) ? ':cp<CR>' : ':lprev<CR>'
noremap <expr> <C-j> empty(filter(getwininfo(), 'v:val.loclist')) ? ':cn<CR>' : ':lnext<CR>'
noremap <expr> <S-q> empty(filter(getwininfo(), 'v:val.loclist')) ? ':cclose<CR>' : ':lclose<CR>'
noremap <leader>cpf :let @+ = expand('%:t')<CR>
noremap <leader>cpw :let @+ = expand('%:t').expand(':').expand('<cword>')<CR>
noremap <leader>cpl :let @+ = expand('%:t').expand(':').line('.')<CR>
imap <C-c> <Esc>
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
let g:netrw_browse_split = 3
autocmd FileType * set formatoptions-=ro