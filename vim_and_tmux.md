
# vim 和tmux配置
> vim和tmux间复制粘贴
> tmux中多个pane跳转hjkl

### vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Tmux Plugin Manager
```
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### vim 配置文件
```
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
set hlsearch incsearch "查询高亮，而且会随着你的输入，动态高亮
"set clipboard=unnamed "和系统剪贴板交互
syntax enable
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system

Plug 'jlanzarotta/bufexplorer'

Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()

map <F9> :NERDTreeToggle<CR>

```

### tmux配置文件
```
set -g focus-events on
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

```

### 使用
打开tmux，创建多个pane
在vim中`yy` 复制，
- 切换到其他pane中的vim，`p`就可以粘贴了
- 切换到其他pane中的shell，`Crtl+b ]`就可以粘贴了



