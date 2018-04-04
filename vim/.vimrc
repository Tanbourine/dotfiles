" DARREN TAN
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles

if has("unix")
	source $HOME/.vim/vimrc/settings.vim
	source $HOME/.vim/vimrc/plugins.vim
	source $HOME/.vim/vimrc/plugin_configs.vim
elseif has ("win32")
	source $HOME/_vim/vimrc/settings.vim
	source $HOME/_vim/vimrc/plugins.vim
	source $HOME/_vim/vimrc/plugin_configs.vim
endif
