" DARREN TAN
" dyztan@gmail.com
" https://github.com/Tanbourine/dotfiles


" COLORS
set t_Co=256
syntax on
colorscheme minimalist
:set number relativenumber



:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END



