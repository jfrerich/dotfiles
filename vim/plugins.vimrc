" - Plugin Setup {{{
filetype plugin on
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
" }}}
" - Plugins Begin {{{
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}
" --- Autocompletion {{{
" ~/.vim/coc-settings.json for settings
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" }}}
" --- Snippets {{{
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-react-snippets'
" }}}
" --- Vim Enhancements {{{
Plugin 'visual-increment'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'adelarsq/vim-matchit'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/tComment'
Plugin 'simnalamburt/mundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'mhinz/vim-startify'
" Automatically clear search highlights after move your cursor
" Plugin 'haya14busa/is.vim'
Plugin 'haya14busa/vim-asterisk'
Plugin 'unimpaired.vim'
Plugin 'quick-scope'
" }}}
" --- Code Navigation {{{
Plugin 'tagbar'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'junegunn/fzf.vim'
Plugin 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-projectionist'
" }}}
" --- Language Specific {{{
Plugin 'python-mode/python-mode'
Plugin 'fatih/vim-go'
Plugin 'perl-support.vim'
" }}}
" --- js, jsx, typescript {{{
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
" }}}
" --- Fonts, Status Line {{{
Plugin 'ryanoasis/vim-devicons'
Plugin 'powerline/powerline-fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" }}}
" --- Markdown {{{
" Plugin 'vimwiki/vimwiki'
" Plugin 'suan/vim-instant-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'plasticboy/vim-markdown'
" }}}
" --- Testing {{{
Plugin 'janko/vim-test'
Plugin 'vim-vdebug/vdebug'
" }}}
" --- git {{{
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
" needed for fugitive :Gbrowse
Plugin 'tpope/vim-rhubarb'
" diff two git directorys :DirDiff <dir1> <dir2>
Plugin 'will133/vim-dirdiff'
" inline git gutter changes
" Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
" }}}
" --- Themes {{{
Plugin 'liuchengxu/space-vim-dark'
Plugin 'rakr/vim-one'
" }}}
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'benknoble/vim-auto-origami'
" {{{ COMMENTED OUT
" }}}
" --- Maybe use in the future {{{
" Plugin editorconfig/editorconfig-vim --> set indent, tab_with for all " editors
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'suan/instant-markdown-d'
" Plugin junegunn/limelight
" Plugin 'vim-polyglot'
" Plugin 'mhinz/vim-grepper'
" Plugin 'tpope/vim-obsession'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
" }}}
" --- vim schema {{{
" Plugin 'bounceme/poppy.vim'
"Plugin 'Solarized'
"Plugin 'elzr/vim-json'
"Plugin 'tpope/vim-sleuth'
"Plugin 'vim-scripts/a.vim'
"Plugin 'vsutil.vim'
" }}}
" --- downloaded some time ago.  {{{ not sure if need, but put here and removed from
" /plugin dir
" Plugin 'prettier/vim-prettier'
"Plugin 'arcseldon/vim-dragvisuals'
"Plugin 'rotate.vim'
"Plugin 'cscope.vim'
"Plugin 'SearchComplete'
"Plugin 'taglist.vim'
"Plugin 'Align.vim'
"Plugin 'table_format.vim'
"Plugin 'vim_IDE.vim'
" Plugin 'bling/vim-bufferline'
" Plugin 'tmhedberg/SimpylFold'
" Bundle 'Valloric/YouCompleteMe' 
" Plugin 'dense-analysis/ale'
" }}}
" --- seems broken {{{
"Plugin 'VimRegEx.vim'
" }}}
" --- PLUGINS not managed by vundle {{{
" bclose.vim script
"let bclose_multiple = 0
" }}}
" --- replaced by another plugin{{{
" Plugin 'ack.vim' -> fzf.vim
" Plugin 'scrooloose/nerdtree'  -> coc-explorer
" }}}

" used this to install cmake
" Old  sudo "/Users/j_honky/Downloads/cmake-3.9.1-Darwin-x86_64/CMake.app/Contents/bin/cmake-gui" --install
" New  brew install CMake

" - Plugins End {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" vim:foldmethod=marker:foldlevel=0
