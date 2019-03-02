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
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline
set updatetime=100

" Enable folding
set foldmethod=indent
set foldlevel=99

set textwidth=79
set incsearch
set number relativenumber
set noscrollbind
set nocursorbind
set visualbell            " turn off visual bell
"set vb t_vb=              " turn off visual bell
set noerrorbells          " turn off error bells
set nowrap                " default to not wrap lines when opening a file
set ignorecase
set smartcase             " overrides idnorecase if uppercase used in search string
set wildmode=longest,list " help command-line
set formatoptions-=a      " auto formatting of paragraphs
set hidden                " can write a buffer, bring up another, go back to original, and undo will work
set showmatch             " briefly show matching (,[,{
set nosol                 " no start of line. when in Visual and do Cntl-D or G, don't go to start of line, but keep in same column
                          " want this for column editing. Ex - HSIM .vec files
set guioptions-=T         " don't view the Toolbar
set winaltkeys=no " Disable menu accelerators.  The Alt key that activates the menu interfere with the Brief key mappings.
set hlsearch
set ruler                " show row, column, and % file in bottom right corner
set completeopt=menu
set csprg=/opt/local/bin/cscope

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
  set undodir=~/.vim/undodir
endif

filetype plugin on
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Cannot add comment at the end of the plugin line
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-obsession'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/tComment'
Plugin 'perl-support.vim'
Plugin 'w0rp/ale'
Plugin 'simnalamburt/mundo.vim'
Plugin 'adelarsq/vim-matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-bufferline'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'arcseldon/vim-dragvisuals'
Plugin 'jiangmiao/auto-pairs'
Plugin 'python-mode/python-mode', {'pinned': 1}
Plugin 'tagbar'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'unimpaired.vim'
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'ack.vim'
" Plugin 'bounceme/poppy.vim'
Plugin 'vim-vdebug/vdebug'
Plugin 'visual-increment'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'
Plugin 'fatih/molokai'
Plugin 'AndrewRadev/splitjoin.vim'

" Maybe use in the future
"
" Plugin editorconfig/editorconfig-vim --> set indent, tab_with for all " editors
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'suan/instant-markdown-d'

" vim schema
"Plugin 'Solarized'
"Plugin 'elzr/vim-json'
"Plugin 'mhinz/vim-signify'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-sleuth'
"Plugin 'vim-scripts/a.vim'
"Plugin 'vsutil.vim'

" downloaded some time ago.  not sure if need, but put here and removed from
" /plugin dir
"Plugin 'rotate.vim'
"Plugin 'cscope.vim'
"Plugin 'SearchComplete'
"Plugin 'taglist.vim'
"Plugin 'Align.vim'
"Plugin 'table_format.vim'
"Plugin 'vim_IDE.vim'

" seems broken
"Plugin 'VimRegEx.vim'

" PLUGINS not managed by vundle
" bclose.vim script
"let bclose_multiple = 0

" used this to install cmake
" Old  sudo "/Users/j_honky/Downloads/cmake-3.9.1-Darwin-x86_64/CMake.app/Contents/bin/cmake-gui" --install
" New  brew install CMake

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" error navigation
" map <C-N> :cnext<CR>   " doesn't work, use unimpaired mapings [q, ]q 
" map <C-M> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Enable folding with the spacebar
nnoremap <space> za
 
vnoremap <c-a> :Inc<CR> " Increment by 1
vnoremap < <gv  " better indentation.  doesn't lose visual selection
vnoremap > >gv  " better indentation.  doesn't lose visual selection

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html,*.js,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2


"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

"####################################
" plugin settings
"####################################
" if has("gui_running")
    " colorscheme torte
    let g:space_vim_dark_background = 233
    colorscheme space-vim-dark " apply after setting let g:space_vim_dark
    hi Comment guifg=#5C6370 ctermfg=59
    hi Comment cterm=italic gui=italic
    hi Visual term=reverse cterm=reverse guibg=Grey50
" endif

"####################################
" vim-go
"####################################
"go build, run, test mappings
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i  <Plug>(go-info)

" use only quickfix list, never location list
let g:go_list_type = "quickfix"
" let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1 " may be overkill -> always show function signature at bottom
let g:go_auto_sameids = 1

let g:go_metalinter_autosave = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

"####################################
" python-mode
"####################################
" Updating Python Mode can cause it to break and I've done it multiple
" times! The best fix I found is to restore an old copy of the bundle/python-mode
" folder from Time Machine backup.  
" supposedly, the following pinned command will tell vundle to not update this
" folder again, if PluginUpdate is run
" an 
let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
let g:pymode_motion = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" let g:pymode_lint_checkers = ['pyflakes']
" let g:pymode_lint_checkers = ['pylint']
" disable whitespace before : check
let g:pymode_lint_ignore = ['E203']
let g:pymode_lint_ignore = ['E401']
let g:pymode_run = 1
let g:pymode_python = "python3"
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope = 1
let g:pymode_doc = 1
let g:ropevim_enable_shortcuts = 1
" Override run current python file key shortcut to Ctrl-Shift-e
" let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
" let g:pymode_doc_bind = "<C-S-d>"
"let g:pymode_quickfix_maxheight = 6

" disable <C-J> and <C-K> nerdtree mappings.  
" this conflicts with shortcuts to navigate split windowns
let g:NERDTreeMapJumpNextSibling = ''

" ctrlp
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMRU'

" w0rp/ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1 " Set this variable to 1 to fix files when you save them.

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" SimpylFold
" let g:SimpylFold_docstring_preview=1

"####################################
" vim-airline
"####################################
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" end vim-airline

"####################################
" YouCompleteMe
"####################################
" Bundle 'Valloric/YouCompleteMe'
" doing a PluginUpdate will sometimes break this plugin and the server needs to
" be restarted.  This is done by going to bundle/YouCompleteMe and running
" python install.py

" YCM and snippet colliding
let g:ycm_use_ultisnips_completer = 1

let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

let g:Perl_PerlRegexAnalyser = 'yes'

"####################################
" EasyMotion
"####################################
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""" prettier
"run prettier before saving
" let g:prettier#autoformat = 0
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" rainbow_parenthesis
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" RainbowParentheses does not work with Plugin 'pangloss/vim-javascript'
" parenthesis aren't colored.  Works for all others and like the pangloss
" syntax better than having colored parenlike the parenthesis more than vim-javascripts
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" let g:poppy_point_enable = 1 

"####################################
" my Plugins and key maps for myplugins
"####################################
source ~/.vim/myplugins/*.vim
"map  :call PrintVariables_Vim()<CR>

"let g:Perl_PerlTags='enabled'
let g:explDetailedList=1 " show delailed list of files (ie. size, date)

" allow for a user of vim folds to save and open folds when reopen the file
" if a user doesn't have the following, I don't think they will see the folds when they load the file
" au BufWinLeave ?* mkview 1
" au BufWinEnter ?* silent loadview 1

"map  :PrintVariables
"map P :PrintVariablesOneLine

"####################################
" map ,# :s/^/#/<CR>:nohlsearch\    " perl # comments

" abbreviations
ab _" "####################################
ab _* *########################################################################
ab _# ####################################

autocmd FileType python call PythonModeText()
function! PythonModeText()
    ab _pr print("In Here!")
    ab _pre print("In Here!") exit()
endfunction

autocmd FileType perl call PerlModeText()
function! PerlModeText()
    ab _pr print "In Here!\n"
    ab _pre print "In Here!\n"; exit;
endfunction
