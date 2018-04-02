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
	
	"Surround - change things inside () [] {}
	Plug 'tpope/vim-surround'	
	
	" handy bracket mappings
	Plug 'tpope/vim-unimpaired'

	" file tree browser
	Plug 'scrooloose/nerdtree'

	" syntax checker
	Plug 'scrooloose/syntastic'

	"Sublime-like multiple select
	Plug 'terryma/vim-multiple-cursors'


	" ============ Git ============

	" nerdtree integration with git
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Git integration
	Plug 'tpope/vim-fugitive'
	

	" =========== Syntax ===========
	
	" Autoformating
	Plug 'Chiel92/vim-autoformat'
	

	" ========== Visuals ===========

	" Minimalist colorscheme
	Plug 'dikiaap/minimalist'

	"airline status line
	Plug 'bling/vim-airline'

	"airline status line themes
	Plug 'vim-airline/vim-airline-themes'

	" filetype highlighting for nerdtree!
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


call plug#end()


