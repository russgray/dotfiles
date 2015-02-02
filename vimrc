" Setup vundle first {{{
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'vim-scripts/taglist.vim'
    Plugin 'altercation/vim-colors-solarized'

    call vundle#end()
" }}}

" Basics {{{
    set background=dark                                 " darkness
    set backspace=indent,eol,start                      " set backspace key behaviour
    set nobackup                                        " turn off auto backup
    set ffs=unix,dos,mac                                " support different newlines
    set textwidth=78                                    " sensible linewrap
    set modeline                                        " obey vim:ts=8 blah blah lines
    set tags=tags;/                                     " tags file

    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

    set nohidden
    set t_Co=256

    syntax on                                           " use syntax highlighting
    filetype on                                         " detect filetype
    filetype indent on
    filetype plugin indent on
    set autoindent                                      " keep indent on new line

    "set clipboard+=unnamed
    set noerrorbells
    set hidden                                          " allow change buffers without saving
" }}}

" UI {{{
    set number
    set cursorcolumn
    set nocursorline
    "set cursorline
    set incsearch                                       " search as I type
    set lazyredraw
    set list                                            " show real tabs
    set listchars=tab:>-,trail:-
    set novisualbell
    set ruler                                           " show line/col numbers
    set shortmess=aOstT
    set showcmd
    set laststatus=2
    set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

    " why isn't this working?
    highlight flicker gui=bold guifg=white cterm=bold ctermfg=white
    au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
"}}}

" Text formatting {{{
    set wrap                                            " turn on line wrap
    set linebreak                                       " don't linewrap mid-word

    set expandtab                                       " no real tabs
    set tabstop=8                                       " real tab size
    set shiftwidth=4
    set softtabstop=4
    set smarttab

    set autoindent
    set formatoptions=rq

    set ignorecase
    set infercase
    set smartcase
" }}}

" Plugins {{{
    " TagList {{{
        let Tlist_Exit_OnlyWindow = 1                   " exit if last window
        let Tlist_Show_One_File = 1                     " only show tags for current buffer
        let Tlist_Compact_Format = 1
        let Tlist_Ctags_Cmd = 'ctags'
        let Tlist_Sort_Type = 'name'

        " just functions and classes please
        let tlist_aspjscript_settings = 'asp;f:function;c:class'
        " just functions and subs please
        let tlist_aspvbs_settings = 'asp;f:function;s:sub'
        " don't show variables in freaking php
        let tlist_php_settings = 'php;c:class;d:constant;f:function'
        " just functions and classes please
        let tlist_vb_settings = 'asp;f:function;c:class;s:sub'

        nnoremap <silent> <F9> :TlistToggle<CR>
    " }}}

    " html {{{
        :let g:no_html_toolbar = 'yes'
        :let g:html_tag_case = 'lowercase'
    " }}}
" }}}

" Mappings {{{
    nnoremap <F3> :bn<CR>

    map <down> :bn<CR>
    map <up> :bp<CR>
    map <left> <nop>
    map <right> <nop>

    imap <down> <nop>
    imap <up> <nop>
    imap <left> <nop>
    imap <right> <nop>

    noremap <C-l> gt
    noremap <C-r> gT

    noremap <S-space> <C-b>
    noremap <space> <C-f>

    map <Leader>v :e ~/.vimrc<cr>      " edit my .vimrc file

" }}}

" Commands {{{
    " helpers for converting code to html
    let html_use_css = 1
    command C2h :source $VIMRUNTIME/syntax/2html.vim|
" }}}

" Autocommands {{{
    " Python {{{
        au BufWritePre *.py :%s/\s\+$//e
        au FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class

        " Make trailing whitespace be flagged as bad.
        highlight BadWhitespace ctermbg=red guibg=red
        au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
        au BufRead,BufNewFile *.py,*.pyw set textwidth=79
        au BufNewFile *.py,*.pyw set fileformat=unix
        let python_highlight_all=1
    " }}}

    " PHP/html {{{
        au BufWritePre *.php :%s/\s\+$//e
        au FileType php,html set textwidth=0
        au FileType php,html nmap <Leader>hn :HTMLmappings on<CR>
        au FileType php,html nmap <Leader>hf :HTMLmappings off<CR>
        au FileType php nnoremap <Leader>G :execute "vimgrep /" . expand("<cword>") . "/j **/*.php" <Bar> cw<CR>
        let php_sql_query = 1
    " }}}

    " C# {{{
        au FileType cs syn keyword csUnspecifiedStatement from select where orderby descending
        au FileType cs syn keyword csType var
    " }}}

    " Oracle/sql {{{
        au BufRead *.bdy set ft=sql
        "au FileType ora set indentexpr=lispindent(v:lnum) foldmethod=indent
    " }}}

    " VB/ASP {{{
        au BufRead *.cls set ft=VB
        au BufRead *.asp set nolist
    " }}}

    " Java {{{
        " turn off tab and trailing whitespace indicators
        au FileType java set list! ts=4
    " }}}

    " Arc {{{
        au BufRead *.arc set ft=lisp
    " }}}

    " VS project files {{{
        au BufRead *.csproj set ft=xml
    " }}}
" }}}

set guifont=Consolas:h10
if has ("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions+=c
    set lines=68
    set columns=140

    " Windows-style copy (visual mode)
    vmap <C-c> "+y
    map <Leader>p "+P

endif

" vim: set foldmethod=marker foldlevel=1:
