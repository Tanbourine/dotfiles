if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

	" Minimalist colorscheme
	Plug 'dikiaap/minimalist'
	
	" All hail Tim Pope
	" vim-sensible, generic settings
	Plug 'tpope/vim-sensible'
	
	" Git integration
	Plug 'tpope/vim-fugitive'
	
	"Surround - change things inside () [] {}
	Plug 'tpope/vim-surround'	
	

	" file tree browser
	Plug 'scrooloose/nerdtree'

call plug#end()



" COLORS
set t_Co=256
syntax on
colorscheme minimalist

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END



