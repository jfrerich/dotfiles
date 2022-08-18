"++++++++++++++++++++keys.vimrc
"
" map <leader> to , {{{
let mapleader = ","
" }}}

" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" vim-fugitive {{{
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Git push<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>

" add command and key map to force push git changes. (used after fugitive ce
" command to edit last commit)
command Gpushforcewithlease :Gpush --force-with-lease
nnoremap <leader>gpf :Gpushforcewithleas<CR>
" }}}
"Split Navigations {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Split Windows {{{
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
" }}}

" fzf.vim {{{
" nmap <Leader>f [fzf-p]
" xmap <Leader>f [fzf-p]
" nnoremap ; :CocCommand fzf-preview.Buffers<CR>
" nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
" nnoremap <silent> <leader>/ :Rg <CR>
" nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
" nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>


" nnoremap <silent> <leader>/ :execute 'Rg ' . input('Rg/')<CR>
nmap ; :Buffers<CR>
nnoremap <silent> <leader>/ :Rg <CR>
" nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader><space> :FzfPreviewProjectFiles<CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

"FZF Buffer Delete
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

nnoremap <silent> <Leader>bD :BD<CR>

" highlight the line so it is easily visible
let $FZF_PREVIEW_COMMAND="COLORTERM=truecolor bat --style=numbers --color=always {}"
" no need to show the column number
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg -g '!package.json' -g '!package-lock.json' --line-number --no-heading --color=always --colors 'match:bg:yellow' --colors 'match:fg:black' --colors 'match:style:bold' --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" \ call fzf#vim#grep(
" \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
" \   fzf#vim#with_preview(), <bang>0)

" nnoremap <leader>* :%s/<c-r>=expand("<cword>")<CR>/
" }}}
" git-gutter {{{
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
" }}}

" nnoremap <silent> <leader>k :call SearchWordWithAg()<CR>
"
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

nnoremap <silent> <leader>n :nohlsearch <CR>

map <S-q> :q<CR>   " doesn't work, use unimpaired mapings [q, ]q 

" error navigation
" map <C-N> :cnext<CR>   " doesn't work, use unimpaired mapings [q, ]q 
" map <C-M> :cprevious<CR>

" Alternate File {{{
nnoremap <leader>a :A<CR>
" nnoremap <leader>a :cclose<CR>
" }}}
" quickfix {{{
nnoremap <Leader>q :Quickfix<CR>
nnoremap <Leader>l :Quickfix!<CR>
"  }}}
" Folding {{{
" Enable folding with the spacebar
nnoremap <space> zA
" }}}
 
vnoremap <c-a> :Inc<CR> " Increment by 1
vnoremap < <gv  " better indentation.  doesn't lose visual selection
vnoremap > >gv  " better indentation.  doesn't lose visual selection

" vim-asterisk {{{
map *   <Plug>(asterisk-z*)
map #   <Plug>(asterisk-z#)
map g*  <Plug>(asterisk-gz*)
map g#  <Plug>(asterisk-gz#)
" }}}
" vim-test {{{
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" }}}
" coc.vim {{{
" Use `[c` and `]c` to navigate diagnostics -> conflicts with [c c] with git
" gutter traversing
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode: >
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use leader leader to open CocCommand in CocFzf view
noremap <silent> <leader><leader> :<C-u>CocFzfList<CR>
noremap <silent> <leader>b        :<C-u>CocFzfList diagnostics --current-buf<CR>

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
" The color is too dark, use vim-go for now
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" comment out because I have <leader>a mapped to show alternate file
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" vmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
" set statusline+="jason"

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
" }}}
" coc.vim - coc-explorer{{{
nmap ge :CocCommand explorer<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
