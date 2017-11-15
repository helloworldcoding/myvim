set nocompatible
set nu
set tabstop=4
set showmatch
set autoindent
set cindent
set shiftwidth=4 "自动对齐空格数
set softtabstop=4 "退格键一次可以删除4个空格
syntax enable
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on

" 不产生swp文件
"set noswapfile

scriptencoding utf-8
set encoding=utf-8 fileencoding=utf-8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'alvan/vim-php-manual'
Plugin 'scrooloose/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" map <F10> :NERDTreeToggle<CR>
map <F9> :NERDTreeToggle<CR>
" 在终端启动vim时，共享NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "û",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "U",
    \ "Deleted"   : "D",
    \ "Dirty"     : "đ",
    \ "Clean"     : "¤",
    \ 'Ignored'   : 'ǐ',
    \ "Unknown"   : "X"
    \ }


"nerdcommenter 配置
" Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1

 " Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 1

 " Align line-wise comment delimiters flush left instead of following code indentation
 let g:NERDDefaultAlign = 'left'

 " Set a language to use its alternate delimiters by default
 "let g:NERDAltDelims_java = 1
 let g:NERDAltDelims_php = 1

 " Add your own custom formats or override the defaults
 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

 " Allow commenting and inverting empty lines (useful when commenting a region)
 let g:NERDCommentEmptyLines = 1

 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1


