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

set t_Co=256				" Set color scheme to 256bit (does not work for all terms)
"set t_Co=8				" Set color scheme to 256bit (does not work for all terms)
 colorscheme happy_hacking
"colorscheme default

set ignorecase				" Case insensitive searching
set smartcase				" search case depending on what you input

" Better split screen navigation key remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splitscrew
set splitbelow
set splitright


" wrap long lines
" set wrap
" set textwidth=80
set textwidth=100
"set colorcolumn=-2

" easy way to get back to normal mode
inoremap jj <ESC>
inoremap kk <ESC>

" tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" code folding
set foldmethod=indent
set foldlevel=4
nnoremap <Space> za

" set encoding explicitly
set encoding=utf-8


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

" =============== gVim Options ======================

if has("gui_running")
	set guioptions-=L			"remove left hand scrollbar
	set guioptions-=R			"remove right hand scrollbar
	set guioptions-=T			"remove toolbar
	function! ScreenFilename()
		if has('amiga')
			return "s:.vimsize"
		elseif has('win32')
			return $HOME.'\_vimsize'
		else
			return $HOME.'/.vimsize'
		endif
	endfunction

	function! ScreenRestore()
		" Restore window size (columns and lines) and position
		" from values stored in vimsize file.
		" Must set font first so columns and lines are based on font size.
		let f = ScreenFilename()
		if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
			let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
			for line in readfile(f)
				let sizepos = split(line)
				if len(sizepos) == 5 && sizepos[0] == vim_instance
					silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
					silent! execute "winpos ".sizepos[3]." ".sizepos[4]
					return
				endif
			endfor
		endif
	endfunction

	function! ScreenSave()
		" Save window size and position.
		if has("gui_running") && g:screen_size_restore_pos
			let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
			let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
						\ (getwinposx()<0?0:getwinposx()) . ' ' .
						\ (getwinposy()<0?0:getwinposy())
			let f = ScreenFilename()
			if filereadable(f)
				let lines = readfile(f)
				call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
				call add(lines, data)
			else
				let lines = [data]
			endif
			call writefile(lines, f)
		endif
	endfunction

	if !exists('g:screen_size_restore_pos')
		let g:screen_size_restore_pos = 1
	endif
	if !exists('g:screen_size_by_vim_instance')
		let g:screen_size_by_vim_instance = 1
	endif
	autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
	autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


" ================= Python Compile in different screen==============
" clear terminal and run python
noremap <F5> <Esc>:w<CR>:!clear;python %<CR>
"noremap <F5> <Esc>:Autoformat<CR>:w<CR>:!clear;python %<CR>


" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F6> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

