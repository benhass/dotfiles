" Make Vim more useful
set nocompatible
" filetype off for Vundle
filetype off                   " required!

  set rtp+=~/.vim/bundle/Vundle.vim

  " Specify a directory for plugins
  " - For Neovim: ~/.local/share/nvim/plugged
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-fugitive'
  Plug 'bmatheny/vim-scala'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
  Plug 'scrooloose/nerdtree'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'bling/vim-airline'
  Plug 'bling/vim-bufferline'

  " Initialize plugin system
  call plug#end()

filetype plugin indent on     " required!
syntax enable
set background=light
colorscheme solarized
set hidden
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Always use spaces instead of tabs
set expandtab
" Autoindent 2 spaces
set shiftwidth=2
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Open Ggrep results in QuickFix window
autocmd QuickFixCmdPost *grep* cwindow
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=5
" Allow filesystem modifications
set modifiable
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Nerdtree config and mapping
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" Ctrl-p infinite max file limit
let g:ctrlp_max_files=0

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version control. It also works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Ctrl-p setup some default ignores
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.(git|hg|svn))$', 'file': '\v\.(png|jpg|jpeg)$' }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" Ctrl-p index dotfiles
let g:ctrlp_dotfiles = 1


if executable('fzf')
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>
  nnoremap <silent> <M-p> :Buffers<cr>
end

" Switch to alternate file
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>

" Enable powerline fonts for airline statusline
let g:airline_powerline_fonts = 1

" Change insert mode cursor type to a pipe
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ctrl-s to save
" ctrl-s to save in insert mode
inoremap <c-s> <c-o>:update<cr>
" ctrl-s to save in visual mode
vnoremap <c-s> <esc>:update<CR>gv
" ctrl-s to save in normal mode
nnoremap <c-s> :update<cr>
