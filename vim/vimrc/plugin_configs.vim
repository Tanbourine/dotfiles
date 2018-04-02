
" NERDTree Options

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



" NERDTree Git Options

