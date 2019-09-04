"version 5.6
"####################################
" default settings
"####################################
set autowrite             " automatically write file if you call :make - used for :GoBuild  
set title
set smarttab
set encoding=utf-8
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
" set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline
set guifont=UbuntuMonoDerivativePowerline-Regular:h13
" set guifont=DejaVuSansMonoPowerline:h11
set updatetime=300
set signcolumn=yes




      "commandPath": "/Users/jfrerich/go/bin/",
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Enable folding
set foldmethod=indent
set foldlevel=99

set textwidth=79
set incsearch
set shell=/bin/sh
set number relativenumber
set noscrollbind
set scrolloff=1
set nocursorbind
set visualbell            " turn off visual bell
"set vb t_vb=              " turn off visual bell
set noerrorbells          " turn off error bells
set nowrap                " default to not wrap lines when opening a file
set ignorecase
set smartcase             " overrides idnorecase if uppercase used in search string
set wildmode=longest,list " help command-line
set formatoptions-=a      " auto formatting of paragraphs
set formatoptions+=j      " delete comment characters when joining lines
set hidden                " can write a buffer, bring up another, go back to original, and undo will work
set showmatch             " briefly show matching (,[,{
set nosol                 " no start of line. when in Visual and do Cntl-D or G, don't go to start of line, but keep in same column
                          " want this for column editing. Ex - HSIM .vec files
set guioptions=           " don't show scrollbars or menu bar"
set winaltkeys=no " Disable menu accelerators.  The Alt key that activates the menu interfere with the Brief key mappings.
set hlsearch
set ruler                " show row, column, and % file in bottom right corner
set completeopt=menu
set csprg=/opt/local/bin/cscope

set noswapfile

let Tlist_Ctags_Cmd = '~/Downloads/ctags-5.8/ctags'

set nocompatible              " required

"""""""""""""""""""""""""""""""""""""""
" define additive keywords to find
" during * and # commands
"""""""""""""""""""""""""""""""""""""""
set iskeyword+=- "add to iskeywords to get gf to open files with -'s such as EMIR files
set iskeyword+=/ "add to iskeywords to help find dspf hierarchical names
set iskeyword+=@ "add to iskeywords to help find dspf hierarchical names
set iskeyword+=! "add to iskeywords to help find dspf hierarchical names

if has('persistent_undo')
  set undofile
  set undodir=~/.vim_undodir
endif
