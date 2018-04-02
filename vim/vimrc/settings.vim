" Darren Tan
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles

" Settings file

" ============== General Config =================

set number relativenumber		"setting hybrid numbers
:augroup numbertoggle			"relative in normal/visual, absolute in insert
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


set hidden				" Keep files in buffer between windows. Access by :ls and :b[N]

set t_Co=256				" Set color scheme to 256bit (does not work for all terms)
"colorscheme happy_hacking
colorscheme minimalist

syntax on				" turn on syntax highlighting

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif



