source $HOME/init.vimrc
source $HOME/plugins.vimrc
source $HOME/plugin_settings.vimrc
source $HOME/keys.vimrc

" --- Highlights {{{ 
" highlight Folded guibg=darkgrey guifg=grey
" highlight Folded ctermfg=141 ctermbg=234 guifg=#9a9aba guibg=#212026

" if has("gui_running")
    let g:space_vim_dark_background = 233
    " colorscheme space-vim-dark " apply after setting let g:space_vim_dark
    colorscheme one " apply after setting let g:space_vim_dark
    " autocmd BufEnter *.go colorscheme space-vim-dark
    " colorscheme one " apply after setting let g:space_vim_dark
set guifont=HackNerdFontComplete-Regular:h14

" highlight goFunction guifg=lightred 
" endif
hi Comment guifg=#5C6370 ctermfg=59
hi Comment cterm=italic gui=italic
hi Visual term=reverse cterm=reverse guibg=#454545
hi Terminal ctermbg=black guibg=black 
 
hi Normal guibg=gray8

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html,*.js,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2

augroup go
  autocmd FileType go syntax match goTRun /t.Run.".*"/
  highlight goTRun guifg=orange 
augroup END

autocmd FileType json syntax match Comment +\/\/.\+$+
highlight jsTest guifg=orange 
autocmd BufRead,BufNewFile *.tsx syntax match jsTest /.*test(.*/

" Add some syntax highlighthing to jsx/tsx snapshots. xml does a decent job
autocmd BufRead,BufNewFile *.tsx.snap,*.jsx.snap setlocal filetype=xml

" }}}

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

"####################################
" my Plugins and key maps for myplugins
"####################################
source ~/.vim/myplugins/*.vim
"map  :call PrintVariables_Vim()<CR>

" allow for a user of vim folds to save and open folds when reopen the file
" if a user doesn't have the following, I don't think they will see the folds when they load the file
" au BufWinLeave ?* mkview 1
" au BufWinEnter ?* silent loadview 1

"map  :PrintVariables
"map P :PrintVariablesOneLine

"####################################
" map ,# :s/^/#/<CR>:nohlsearch\    " perl # comments


" ---  Abbreviations {{{
ab _" "####################################
ab _* *########################################################################
ab _# ####################################
" }}}

autocmd FileType python call PythonModeText()
function! PythonModeText()
    ab _pr print("In Here!")
    ab _pre print("In Here!") exit()
endfunction

augroup javascript_folding
    au!
    " .ts, .tsx, .js, .jsx
    " au FileType typescript,typescript.tsx,javascript,javascriptreact setlocal foldmethod=syntax
augroup END


" augroup autofoldcolumn
"   au!
"   " Or whatever autocmd-events you want
"   au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
" augroup END

autocmd FileType perl call PerlModeText()
function! PerlModeText()
    ab _pr print "In Here!\n"
    ab _pre print "In Here!\n"; exit;
endfunction

" if exists('g:loaded_webdevicons')
"     call webdevicons#refresh()
" endif
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" vim:foldmethod=marker:foldlevel=0
