" DARREN TAN
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles

if has("unix")
	source $HOME/.vim/vimrc/plugins.vim
	source $HOME/.vim/vimrc/plug_configs.vim
	source $HOME/.vim/vimrc/settings.vim
elseif has ("win32")
	source $HOME/_vim/vimrc/plugins.vim
	source $HOME/_vim/vimrc/plug_configs.vim
	source $HOME/_vim/vimrc/settings.vim
endif


" Auto source vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
