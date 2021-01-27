set nocompatible
filetype off

" runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'jmcantrell/vim-virtualenv'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv'

call vundle#end()
filetype plugin indent on

set nu
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

" python cfg
let python_highlight_all=1
syntax on

" encoding
set encoding=utf-8

" folding
set foldmethod=indent
set foldlevel=99

" key(s) maps
nnoremap <space> za

" NERDTree cfg
let NERDTreeIgnore=['\.pyc$', '\~$']

" virtualenv
let g:virtualenv_directory = '.'

" vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" python-mode/python-mode
let g:python_mode = 'python'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Jedi
let g:jedi#show_call_signatures = 2
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures_dalay = 0

if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
        au! *
        au User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
        au User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
endif

" themes
colorscheme monokai 
let g:airline_theme="dark"

" cpp
nnoremap <C-c> :!clang++ -o %:r.out % --std=c++17<Enter>
nnoremap <C-x> :!./%:r.out
