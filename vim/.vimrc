"version 5.6
"####################################
" default settings
"####################################
set title
set smarttab
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=79
set incsearch
set number relativenumber
set noscrollbind
set nocursorbind
set visualbell          " turn off visual bell
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
"set filetype=on
set hlsearch
set ruler                " show row, column, and % file in bottom right corner
set completeopt=menu
set csprg=/opt/local/bin/cscope

let Tlist_Ctags_Cmd = '~/Downloads/ctags-5.8/ctags'


" au BufNewFile,BufRead *.html,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
"####################################
" ADDED 09/05/17
"
" Other plugin suggestion pages
" https://vimawesome.com/
"
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype plugin on
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/dotfiles/.vim')

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
" Plugin 'vim-syntastic/syntastic'
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

" Maybe use in the future
" move to location in file.  not really needed.  Just do search
"
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'suan/instant-markdown-d'

" replacement for syntastic.  Updated syntax live taking advantage of asynchrous vim 8.0
" would be nice, but need to figure if all errors can be shown in a buffer, like syntastic
"Plugin 'w0rp/ale'

" vim schema
"Plugin 'Solarized'
"Plugin 'altercation/vim-colors-solarized'
" Plugin 'terryma/vim-multiple-cursors' - just use gn command
"Plugin 'arcseldon/vim-dragvisuals' - good idea, but really slow
"Plugin 'elzr/vim-json'
"Plugin 'mhinz/vim-signify'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-sleuth'
"Plugin 'vim-scripts/a.vim'
"Plugin 'vsutil.vim'
"Plugin 'VimRegEx.vim'


" downloaded some time ago.  not sure if need, but put here and removed from
" /plugin dir
"Plugin 'rotate.vim'
"Plugin 'cscope.vim'
"Plugin 'increment.vim'
"Plugin 'SearchComplete'
"Plugin 'taglist.vim'
"Plugin 'Align.vim'
"Plugin 'table_format.vim'
"Plugin 'vim_IDE.vim'
" seems broken
"Plugin 'VimRegEx.vim'
"Plugin 'Vimball'


" PLUGINS not managed by vundle
" bclose.vim script
"let bclose_multiple = 0



"Plugin 'snipmate-snippets'
"Plugin 'vim-scripts/ultisnips'

" not working
"Plugin 'mattn/calendar.vim'
"Plugin 'Headlights'

" used this to install cmake
" Old  sudo "/Users/j_honky/Downloads/cmake-3.9.1-Darwin-x86_64/CMake.app/Contents/bin/cmake-gui" --install
" New  brew install CMake

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
 
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType vim setlocal shiftwidth=2 
au BufNewFile,BufRead *.html,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2
" To add the proper PEP8 indentation, add the following to your .vimrc:
" taken care of by pymode
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ softtabstop=4
"     \ shiftwidth=4
"     \ textwidth=79
"     \ expandtab
"     \ autoindent
"     \ fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css
"   \ set tabstop=2
"   \ softtabstop=2
"   \ shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

let python_highlight_all=1
let g:ycm_python_binary_path = 'python'
" syntax on
" END ADDED 9/1/2017
"####################################


"####################################
" plugin settings
"####################################


" Bundle 'Valloric/YouCompleteMe'
" doing a PluginUpdate will sometimes break this plugin and the server needs to
" be restarted.  This is done by going to bundle/YouCompleteMe and running
" python install.py

" if has("gui_running")
    " colorscheme torte
    colorscheme space-vim-dark
    let g:space_vim_dark_background = 233
    hi Comment guifg=#5C6370 ctermfg=59
    hi Comment cterm=italic gui=italic
" endif

" disable syntastic checking for python (using pymode for checking)
" let g:syntastic_ignore_files = ['\.py$']
" let g:syntastic_mode_map = { 'mode': 'active',
"             \ 'active_filetypes': [],
"             \ 'passive_filetypes': ['python'] }

"python-mode
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
let g:ctrlp_cmd = 'CtrlP'

" w0rp/ale
" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:ale_javascript_eslint_use_global = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_python_checkers = ['python']
" let g:syntastic_enable_python_checker = 1

" let g:syntastic_perl_checkers = ['perl']
" let g:syntastic_enable_perl_checker = 1

" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" let g:syntastic_enable_javascript_checker = 1

" SimpylFold
" let g:SimpylFold_docstring_preview=1

" vim-airline
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline
" set guifont=DejaVu\ Sans:s12
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

" YCM and snippet colliding
let g:ycm_use_ultisnips_completer = 1

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:Perl_PerlRegexAnalyser = 'yes'

"" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

""" EasyMotion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

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
" parenthesis aren't colored.  Workds for all others and like the pangloss
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

" END ADDED 09/05/17
"####################################


"let g:Perl_PerlTags='enabled'
"""""""""""""""""""""""""""""""""""""""
" define additive keywords to find
" during * and # commands
"""""""""""""""""""""""""""""""""""""""
" if > and in perl, don't add as a keyword
" set iskeyword+=: "add to iskeywords to help find dspf hierarchical names -
" removed for python : after else 
set iskeyword+=- "add to iskeywords to get gf to open files with -'s such as EMIR files
set iskeyword+=/ "add to iskeywords to help find dspf hierarchical names
set iskeyword+=< "add to iskeywords to help find dspf hierarchical names
set iskeyword+=> "add to iskeywords to help find dspf hierarchical names
set iskeyword+=@ "add to iskeywords to help find dspf hierarchical names
set iskeyword+=! "add to iskeywords to help find dspf hierarchical names
" set iskeyword+=. "add to iskeywords to help find dspf hierarchical names,
" removed because python .
let g:explDetailedList=1 " show delailed list of files (ie. size, date)

" allow for a user of vim folds to save and open folds when reopen the file
" if a user doesn't have the following, I don't think they will see the folds when they load the file
" au BufWinLeave ?* mkview 1
" au BufWinEnter ?* silent loadview 1

vnoremap <c-a> :Inc<CR> " Increment by 1
vnoremap < <gv  " better indentation.  doesn't lose visual selection
vnoremap > >gv  " better indentation.  doesn't lose visual selection

" buffers
"map <A-n> :bn<CR>
"map <A-p> :bp<CR>
"map <A-d> :bd:sp:bn

"map  :PrintVariables
"map P :PrintVariablesOneLine

"
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

" Perl helpfuls
"make vim indent when have smartindent on and placing a #
"where ^H is typed as <Ctrl-V><Back-Space>.
inoremap # X<BS>#

"You need the next line to change the color back when you hit escape.
"inoremap <Esc> <Esc>:highlight Normal guibg=white<cr>
"
"""""""""""""""""""""""""""""""""""""""
" useful, but not always used
":set number/nonumber
":h option-list   -- get all options for .vimrc file

"""""""""""""""""""""""""""""""""""""""
"if did_filetype()	" filetype already set..
"    finish		" ..don't do these checks
"endif
"if getline(1) =~ '^#'
"    setfiletype place
"elseif getline(1) =~? '\<drawing\>'
"    setfiletype drawing
"endif

"ource/export/circuits/software/PrintTimingPath/nt.vim
"ource /export/circuits/software/PrintTimingPath/pmill.vim

"  au! BufNewFile,BufRead 	*.err,*.cap_increase    :call MapNT()

"####################################
"
" permanent mappings
" these were the original default mappings. Once a file is opened that calls
"    one of the following functions, the default mappings will not work for other
"    filetypes.  The defaults must be placed inside each function.
"
" the best option is to only set f(x) key mappings for specific filetypes and have
" general f(x)'s map to other keys. In general, the f(x) keys are keys that are shared
" for multiple filetypes and perform specific f(x)'s that are documented with the strip
" on the keyboard. (~/misc/key_bindings)
" function key mappings are in ~/.vim/plugin/maps.vim

" function MapPmill()
"     setfiletype pmill
" endfunction
"
" function MapNT()
"     setfiletype nt
" endfunction

"####################################
" function Test()
"     norm d
"     "exe "norm d"
"     "exe line("G")
"     "exe "norm! d"
"     "norm "G"
"     exe "norm! d"
"     "norm "p"
"     "exe "P"
"     exe "norm! G"
" endfunction

"map z di stack<CR> use<CR> <ESC> P '] i stack<CR> use<CR> <ESC> ^
"map z di stack<CR> use<CR>  P '] i stack<CR> use<CR> <ESC> ^
"map z :call Test()<CR>


"let g:ConqueTerm_Color = 1
"let g:ConqueTerm_TERM = 'vt100'
"let g:ConqueTerm_Syntax = 'conque'
"let g:ConqueTerm_ReadUnfocused = 1

"aunmenu *
"unmenu Toolbar
"unmenu! Toolbar

"file-explorer

"syntax match CurrentLine  /.*\%#.*/
"hi link CurrentLine Visual
"hi CurrentLine guifg=white guibg=lightblue
"syntax match CurrentLine "NONE"
":map j j:hi CurrentLine guifg=blue guibg=lightblue<cr>
"hi CurrentLine guifg=white guibg=lightblue

"  01/26/10 - moved pmill to NT setup
"  au BufNewFile,BufRead 	*dspf,*netlist*,*.spi,*.vec,vec.*,*.mon,*wire,*.inc,*.tech,*.lib,*.prepped,*.net,*.dpf		setfiletype spice
"  au BufNewFile,BufRead 	*README  	 				setfiletype readme
"  au BufNewFile,BufRead 	*.vipp,*.vndl  	 				setfiletype verilog
"  au! BufNewFile,BufRead 	*.err,*.cap_increase    so /export/home/jason/.vim/mappmill.vim
"  au! BufNewFile,BufRead 	*.src          		so /export/home/jason/.vim/mapndl.vim
"  au! BufNewFile,BufRead 	*.err,*.cap_increase    :call MapNT()
