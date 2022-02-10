" Plugins
call plug#begin()

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'


" ALE
Plug 'dense-analysis/ale'


" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" vimtex

" Plug 'KeitaNakamura/tex-conceal.vim'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'

" settings for sumatraPDF
let g:vimtex_view_method='zathura' " Linux
" let g:vimtex_view_general_viewer = 'SumatraPDF' " Windows
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" UltiSnips

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" vim surround
Plug 'tpope/vim-surround'


" Colorschemes
Plug 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'


" NERDTree
Plug 'preservim/nerdtree'


" Lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {}
let g:lightline.colorscheme = 'onedark'
set laststatus=2

call plug#end()


" Colorschemes

syntax enable
set termguicolors

" set background=dark
" colorscheme solarized

" " let g:molokai_original = 1
" colorscheme molokai

set background=dark
let g:quantum_black=1
colorscheme quantum
" This is necessary for colorschemes for which the highlight group for concealed characters is not defined
hi clear Conceal

" set background=dark
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox


" NERDTree settings

" Open NERDTree if opening directory path
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Open NERDTree on vim startup if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Exit vim if NERDTree is only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree toggle
map <C-t> :NERDTreeToggle<CR>


" Fuzzy finder
map <C-k> :Files<CR>


" vim multi cursor mappings
let g:VM_maps = {}
let g:VM_maps['Exit'] = '<C-c>'


" Trim trailing whitespace
fun! StripTrailingWhiteSpace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd bufwritepre * :call StripTrailingWhiteSpace()


" TODO no idea what this is
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" TODO
" set backupdir=%HOMEPATH%/vimfiles
" set directory=%HOMEPATH%/vimfiles
" set undodir=%HOMEPATH%/vimfiles


" Indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Line numbers
:set number


" TODO
