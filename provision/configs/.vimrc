" for nvim python support
if has('nvim')
    runtime! plugin/python_setup.vim
endif

set nocompatible              " be iMproved, required
set guifont=Menlo:h12
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'Tagbar'
Plugin 'bling/vim-airline'
Plugin 'miyakogi/conoline.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set expandtab
set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set hidden          "switch buffers without saving
set laststatus=2    
set number
set mouse=a
set linespace=2
syntax on
set background=dark
" colorscheme github
colorscheme valloric
" set cursorline
" colorscheme dracula
" Plugins
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1
let g:ycm_global_ycm_extra_conf = '/Users/atkvo/dev/.ycm_extra_conf.py'
nmap <F8> :TagbarToggle<CR>

" YCM
nmap <F3> :YcmCompleter GoTo<CR>
let g:ycm_filetype_blacklist = {'tagbar': 1}
let g:ycm_python_binary_path = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" tagbar 
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/usr/local/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
