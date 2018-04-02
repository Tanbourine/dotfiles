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
	
	" file tree browser
	Plug 'scrooloose/nerdtree'
	
	" ============ Git ============
"
	" nerdtree integration with git
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Git integration
	Plug 'tpope/vim-fugitive'
	

	" ========== Visuals ===========
	" Minimalist colorscheme
	Plug 'dikiaap/minimalist'
	
call plug#end()


