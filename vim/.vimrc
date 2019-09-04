source $HOME/init.vimrc
source $HOME/plugins.vimrc
source $HOME/plugin_settings.vimrc
source $HOME/keys.vimrc

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
