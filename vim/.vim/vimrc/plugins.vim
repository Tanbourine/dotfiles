" Darren Tan
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles
" All plugins for vim


" Auto-install vim-plug to new systems
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
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

" align everything!
Plug 'godlygeek/tabular'

" easily edit markdown
Plug 'plasticboy/vim-markdown'

" autocomplete everything!
Plug 'valloric/youcompleteme'
 
" comment everything!
Plug 'scrooloose/nerdcommenter'

" personal wiki
Plug 'vimwiki/vimwiki'

" browse source code tags
Plug 'vim-scripts/taglist.vim'

" ============ Git ============

" nerdtree integration with git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git integration
Plug 'tpope/vim-fugitive'

" Git gutter
Plug 'airblade/vim-gitgutter'


" =========== Syntax ===========

" syntax checker
Plug 'scrooloose/syntastic'


" Autoformating
Plug 'Chiel92/vim-autoformat'

" Jinja formatting
Plug 'glench/vim-jinja2-syntax'

" quick HTML and CSS tags
Plug 'mattn/emmet-vim'

" i3 syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax'

" ========== Visuals ===========

" Minimalist colorscheme
Plug 'dikiaap/minimalist'

" Jellybean colorscheme
Plug 'nanotech/jellybeans.vim'

" Happy Hacking coloscheme
Plug 'YorickPeterse/happy_hacking.vim'

"airline status line
Plug 'bling/vim-airline'

"airline status line themes
Plug 'vim-airline/vim-airline-themes'


call plug#end()

autocmd! BufWritePost .vimrc so $MYVIMRC
