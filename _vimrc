" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
source C:\Users\11217\vimfiles\autoload\plug.vim

call plug#begin('~\vimfiles\plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'yegappan/mru'

Plug 'jlanzarotta/bufexplorer'


" Any valid git URL is allowed Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()


noremap <F6>  :NERDTreeToggle <CR>






colorscheme morning
set guifont=Consolas:h12
set nu
set relativenumber
set tabstop=4
" set undodir=F:\vim_backup_undo_dir
" set backupdir=F:\vim_backup_undo_dir
set fileencodings=utf-8,chinese,latin-1
set encoding=utf-8
set belloff=all
syntax on
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
set diffexpr=MyDiff()
endif
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg1 = substitute(arg1, '!', '\!', 'g')
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg2 = substitute(arg2, '!', '\!', 'g')
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let arg3 = substitute(arg3, '!', '\!', 'g')
if $VIMRUNTIME =~ ' '
  if &sh =~ '\<cmd'
    if empty(&shellxquote)
      let l:shxq_sav = ''
      set shellxquote&
    endif
    let cmd = '"' . $VIMRUNTIME . '\diff"'
  else
    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
  endif
else
  let cmd = $VIMRUNTIME . '\diff'
endif
let cmd = substitute(cmd, '!', '\!', 'g')
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
if exists('l:shxq_sav')
  let &shellxquote=l:shxq_sav
endif
endfunction
