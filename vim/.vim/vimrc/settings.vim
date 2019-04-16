" DARREN TAN
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
set history=1000        " remember more commands and search history
set undolevels=1000     " more undos
set autoread            " auto read when file is changed from outside
set noshowmode          " don't show mode ("-- INSERT --") at bottom
set nobackup            " no backup files
set shortmess=a         " tries to avoid "hit enter to continue" messages
set cursorline          " highlights current line

set t_Co=256				" Set color scheme to 256bit (does not work for all terms)
set background=dark
" colorscheme happy_hacking
colorscheme mango
" colorscheme Atelier_PlateauDark
hi Normal guibg=NONE ctermbg=NONE

set ignorecase				" Case insensitive searching
set smartcase				" search case depending on what you input

set scrolloff=2
set showmatch               " show matching bracket (briefly jump)

" use system clipboard
set clipboard=unamed

" Open new line below and above current line
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" jump to next mark
nnoremap <leader>' ]'
nnoremap <leader>" ['

" More natural splitscrew
set splitbelow
set splitright

let mapleader = " "



" easy way to get back to normal mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>

" ============== Python Settings ===================
" tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" wrap long lines
" set wrap
" set textwidth=80
set textwidth=100
set colorcolumn=-2

" code folding
set foldmethod=indent
set foldlevel=10
" nnoremap <Space> za

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <leader>k :move-2<cr>
nnoremap <silent> <leader>j :move+<cr>
nnoremap <silent> <leader>h <<
nnoremap <silent> <leader>l >>


" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>



" Better split screen navigation key remap
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>



" clear terminal and run python
noremap <F5> <Esc>:w<CR>:!clear;python %<CR>
" noremap <F6> <Esc>:w<CR>:!clear;python3 %<CR>

noremap <F7> <Esc>:!clear;subl %<CR><CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" ============== Syntax Specific ===================
au! BufRead,BufNewFile *.md set filetype=mkd	" set .md files as markdown

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif



" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
