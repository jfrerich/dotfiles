"++++++++++++++++++++keys.vimrc
"
" map <leader> to , {{{
let mapleader = ","
" }}}

" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" fzf.vim
nmap ; :Buffers<CR>
nnoremap <silent> <leader>/ :execute 'Rg ' . input('Rg/')<CR>
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <leader>* :%s/<c-r>=expand("<cword>")<CR>/

" nnoremap <silent> <leader>k :call SearchWordWithAg()<CR>
"
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" error navigation
" map <C-N> :cnext<CR>   " doesn't work, use unimpaired mapings [q, ]q 
" map <C-M> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

nnoremap <Leader>q :Quickfix<CR>
nnoremap <Leader>l :Quickfix!<CR>

" Enable folding with the spacebar
" nnoremap <space> za
 
vnoremap <c-a> :Inc<CR> " Increment by 1
vnoremap < <gv  " better indentation.  doesn't lose visual selection
vnoremap > >gv  " better indentation.  doesn't lose visual selection

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html,*.js,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2

"####################################
" coc.vim
"####################################


" Use `[c` and `]c` to navigate diagnostics -> conflicts with [c c] with git
" gutter traversing
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight') 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" function! StatusDiagnostic() abort
"   let info = get(b:, 'coc_diagnostic_info', {})
"   if empty(info) | return '' | endif
"   let msgs = []
"   if get(info, 'error', 0)
"     call add(msgs, 'E' . info['error'])
"   endif
"   if get(info, 'warning', 0)
"     call add(msgs, 'W' . info['warning'])
"   endif
"   return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
" endfunction

" set statusline^=%{StatusDiagnostic}


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
