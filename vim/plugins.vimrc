filetype plugin on
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

"plugin 'coc.vim'  --> has to be manually installed
" ~/.vim/coc-settings.json for settings
" replacement for youcomplete and ale linter
" uses vscode extensions
" Bundle 'Valloric/YouCompleteMe' 
" Plugin 'w0rp/ale'

" let Vundle manage Vundle, required
" Cannot add comment at the end of the plugin line
Plugin 'VundleVim/Vundle.vim'

" --- snippets ---
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-react-snippets'

" --- NERDtree ---
Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" --- vim enhancements ---
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'

" Automatically clear search highlights after move your cursor
Plugin 'haya14busa/is.vim'

" --- code specific ---
Plugin 'python-mode/python-mode', {'pinned': 1}

" --- js, jsx, typescript
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'

Plugin 'fatih/vim-go'
Plugin 'perl-support.vim'

" --- fonts, status line---
Plugin 'ryanoasis/vim-devicons'
Plugin 'powerline/powerline-fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" --- Markdown ---
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'iamcco/markdown-preview.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-obsession'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
Plugin 'vim-scripts/tComment'
Plugin 'simnalamburt/mundo.vim'
Plugin 'adelarsq/vim-matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
" Plugin 'bling/vim-bufferline'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-vdebug/vdebug'
Plugin 'visual-increment'
Plugin 'tagbar'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'rakr/vim-one'
Plugin 'easymotion/vim-easymotion'
Plugin 'unimpaired.vim'
Plugin 'ack.vim'

" inline git gutter changes
" Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
Plugin 'dbeniamine/cheat.sh-vim'

Plugin 'tpope/vim-projectionist'
Plugin 'editorconfig/editorconfig-vim'

" Plugin 'vim-polyglot'

" Maybe use in the future
"
" Plugin editorconfig/editorconfig-vim --> set indent, tab_with for all " editors
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'suan/instant-markdown-d'

" vim schema
" Plugin 'bounceme/poppy.vim'
"Plugin 'Solarized'
"Plugin 'elzr/vim-json'
"Plugin 'mhinz/vim-signify'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-sleuth'
"Plugin 'vim-scripts/a.vim'
"Plugin 'vsutil.vim'

" downloaded some time ago.  not sure if need, but put here and removed from
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
