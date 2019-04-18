" Darren Tan
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles
" All plugins for vim


" Auto-install vim-plug to new systems
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Add all plugins
call plug#begin()

" ======= Basic Plugins ========

" vim-sensible, generic settings
Plug 'tpope/vim-sensible'

" Surround - change things inside () [] {}
Plug 'tpope/vim-surround'

" handy bracket mappings
Plug 'tpope/vim-unimpaired'

" file tree browser
Plug 'scrooloose/nerdtree'

" Sublime-like multiple select
Plug 'terryma/vim-multiple-cursors'

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

"fuzzy file finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" align everything!
Plug 'godlygeek/tabular'

" easily edit markdown
Plug 'plasticboy/vim-markdown'

" autocomplete everything!
Plug 'valloric/youcompleteme'
"
" gcc to comment
Plug 'tpope/vim-commentary'

" Python mode!
" Plug 'python-mode/python-mode', { 'branch': 'develop' }

" comment everything!
"Plug 'scrooloose/nerdcommenter'

" personal wiki
" Plug 'vimwiki/vimwiki'

" indent guides
Plug 'yggdroot/indentline'

" show whitespace
Plug 'ntpeters/vim-better-whitespace'

" browse source code tags
Plug 'vim-scripts/taglist.vim'

" add marks for navigation
Plug 'kshenoy/vim-signature'

" access virtualenvs
" Plug 'plytophogy/vim-virtualenv'

" ============ Git ============

" nerdtree integration with git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git integration
Plug 'tpope/vim-fugitive'

" Git gutter
Plug 'airblade/vim-gitgutter'


" =========== Syntax ===========

" syntax checker
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'


" Autoformating
Plug 'Chiel92/vim-autoformat'

" Jinja formatting
"Plug 'glench/vim-jinja2-syntax'

" quick HTML and CSS tags
"Plug 'mattn/emmet-vim'

" i3 syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax'

" snippets engine!
Plug 'SirVer/ultisnips'

" snippets repo
Plug 'honza/vim-snippets'

" ctags to jump to function defs
Plug 'universal-ctags/ctags'

" Kivy syntax highlighting
Plug 'farfanoide/vim-kivy'

" ========== Visuals ===========

" Minimalist colorscheme
Plug 'dikiaap/minimalist'

" Jellybean colorscheme
Plug 'nanotech/jellybeans.vim'

" Happy Hacking coloscheme
Plug 'YorickPeterse/happy_hacking.vim'

" Huge colorscheme pack
Plug 'flazz/vim-colorschemes'

"airline status line
Plug 'bling/vim-airline'

"airline status line themes
Plug 'vim-airline/vim-airline-themes'


call plug#end()

autocmd! BufWritePost .vimrc so $MYVIMRC
