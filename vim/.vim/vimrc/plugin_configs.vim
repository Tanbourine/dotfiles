" Darren Tan

" dyztan@gmail.com

" https://github.com/Tanbourine/dotfiles


" ========= NERDTree Options ==========

" NERDTrees File highlighting

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)

	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg

	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'

endfunction


au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#292929')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#292929')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#292929')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#292929')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#292929')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#292929')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#292929')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#292929')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#292929')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#292929')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#292929')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#292929')
au VimEnter * call NERDTreeHighlightFile('vim', 'green', 'none', 'green', '#292929')
au VimEnter * call NERDTreeHighlightFile('py', 'green', 'none', 'Magenta', '#292929')



" Start NERDTree when opening vim with no arguments
autocmd StdinReadPre * let std_in=1
autocmd VimEnter * if argc() == 0 && !exists("std_in") | NERDTree | endif


" Start NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" close NERDTree when you open a file
let NERDTreeQuitOnOpen = 1


" Minimal UI
let NERDTreeMinimalUI = 1

" Add arrows
let NERDTreeDirArrows = 1

" remap NERDTree to shortcut CTRL+M
map <C-m> :NERDTreeToggle<CR>

" prevent NERDTree from resizing window
autocmd VimEnter * set winfixwidth

" ========== Syntastic Options ==========

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1



" ========== Airline Options ============

" let g:airline#extensions#tabline#left_set = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#formatter = 'default'



" ==========Autoformat Options ===========

" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>
