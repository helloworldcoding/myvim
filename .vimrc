set nocompatible
set nu
set relativenumber
set showmatch
set autoindent
set autochdir
set cindent
set tabstop=4
set shiftwidth=4 "自动对齐空格数
set softtabstop=4 "退格键一次可以删除4个空格
set expandtab
set hlsearch incsearch "查询高亮，而且会随着你的输入，动态高亮
"set clipboard=unnamed "和系统剪贴板交互
set cc=80   "80列高亮                                                                    
set ruler                                                                       
vnoremap <C-y> "+y 
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on
" 快速打开vim配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 重新加载vim配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
" 执行当前vimscript脚本
nnoremap <leader>sr :source %<cr>
" 去掉高亮
nnoremap ,, :noh<cr>
" insert模式下，映射esc
" inoremap jj <esc>
" insert模式下的一些缩写
iabbrev adn and
iabbrev ture true
iabbrev @- ---<cr>layout: post<cr>title: "" <cr>tags: []<cr>description: "" <cr>---<cr>
iabbrev @g runningele@gmail.com 
iabbrev @m mingazi@163.com 

" autocmd
autocmd FileType php :iabbrev <buffer> iff if () {<cr>}<cr><esc>kkA<left><left><left>

" statusline
set laststatus=2
set statusline=buf%n\ %m
set statusline+=\ %l,%v/%L
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %{(exists(\"bomb\")\ &&\ &bomb)?\"Bom\":\"\"}
set statusline+=%{StatuslineGit()}
set statusline+=\ %F

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! DeleteSwapFile()
	let l:fname = fnameescape()
	echo l:fname
endfunction


scriptencoding utf-8
set encoding=utf-8 fileencoding=utf-8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp^=~/.vim/bundle/vim-erlang-compiler
"set rtp^=~/.vim/bundle/vim-erlang-omnicomplete
"set rtp^=~/.vim/bundle/vim-erlang-runtime
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dadbod'
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
Plugin 'vim-syntastic/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'wakatime/vim-wakatime'
Plugin 'fatih/vim-go'
Plugin 'previm/previm'
"Plugin 'NLKNguyen/pipe.vim'
"Plugin 'NLKNguyen/pipe-mysql.vim'
Plugin 'dbext.vim'
Plugin 'aklt/plantuml-syntax'
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

" syntastic recommand config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_rst_checkers = ['Sphinx']

"let g:previm_open_cmd = 'open -a Google\ Chrome'
"let g:previm_open_cmd = 'open -a Firefox'
let g:previm_open_cmd = 'google-chrome -a'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" dbext mysql 设置
" mysql -uyk -pyk123456 -Dyk_upgrader -h127.0.0.1
let g:dbext_default_profile_mySQL = 'type=MYSQL:user=yk:passwd=yk123456:dbname=yk_upgrader'
"let g:dbext_default_profile_mySQL_DBI = 'type=DBI:user=yk:passwd=yk123456:driver=mysql:conn_parms=database=yk_upgrader;host=127.0.0.1' 

" 删除当前文件对应的swp和swo文件
function! DeleteSpaw()
	let l:fname = fnameescape(expand('%:t'))
	let l:swp = '.'.l:fname.'.swp'
	let l:swo = '.'.l:fname.'.swo'
	if CheckFile(l:swp)
		echom DeleteFile(l:swp) == 1 ? l:swp.' delete successfully' : l:swp.' delete faild '
	endif
	if CheckFile(l:swo)
		echom DeleteFile(l:swo) == 1 ? l:swo.' delete successfully' : l:swo.' delete faild '
	endif
endfunction

function! DeleteFile(filename)
	let l:del_result = delete(expand(a:filename))
	return l:del_result == 0 ? 1 : 0
endfunction

function! CheckFile(filename)
	" 对于不可以读取的文件，换成glob
	if filereadable(expand(a:filename)) 
		return 1
	else
		return 0
	endif
endfunction

" 调用删除swp,swo文件函数
nnoremap <leader>ds :call DeleteSpaw()<cr>


" copy yank buffer to system clipborad
" use osc52 to put things into the system clipbord,works over ssh
function! Osc52Yank()
	let buffer=system('base64 -w0',@0) " -w0 to disable 76 char line wrapping
	let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
	silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction

nnoremap <leader>y :call Osc52Yank()<cr>


function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
