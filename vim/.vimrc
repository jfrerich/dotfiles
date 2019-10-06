source $HOME/init.vimrc
source $HOME/plugins.vimrc
source $HOME/plugin_settings.vimrc
source $HOME/keys.vimrc

" highlight Folded guibg=darkgrey guifg=grey
highlight Folded ctermfg=141 ctermbg=234 guifg=#9a9aba guibg=#212026

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

autocmd FileType json syntax match Comment +\/\/.\+$+
highlight jsTest guifg=orange 
autocmd BufRead,BufNewFile *.tsx syntax match jsTest /.*test(.*/

" abbreviations
ab _" "####################################
ab _* *########################################################################
ab _# ####################################

autocmd FileType python call PythonModeText()
function! PythonModeText()
    ab _pr print("In Here!")
    ab _pre print("In Here!") exit()
endfunction

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
