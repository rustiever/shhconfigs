"
"       / /\         / /\    / /\ / /\                /\ \        / /\                /\ \     _
"      / /  \       / / /   / / // /  \              /  \ \      / /  \              /  \ \   /\_\
"     / / /\ \__   / /_/   / / // / /\ \            / /\ \ \    / / /\ \            / /\ \ \_/ / /
"    / / /\ \___\ / /\ \__/ / // / /\ \ \          / / /\ \_\  / / /\ \ \          / / /\ \___/ /
"    \ \ \ \/___// /\ \___\/ // / /  \ \ \        / / /_/ / / / / /  \ \ \        / / /  \/____/
"     \ \ \     / / /\/___/ // / /___/ /\ \      / / /__\/ / / / /___/ /\ \      / / /    / / /
" _    \ \ \   / / /   / / // / /_____/ /\ \    / / /_____/ / / /_____/ /\ \   / / /    / / /
"/_/\__/ / /  / / /   / / // /_________/\ \ \  / / /\ \ \  / /_________/\ \ \  / / /    / / /
"\ \/___/ /  / / /   / / // / /_       __\ \_\/ / /  \ \ \/ / /_       __\ \_\/ / /    / / /
" \_____\/   \/_/    \/_/ \_\___\     /____/_/\/_/    \_\/\_\___\     /____/_/\/_/     \/_/
"

source $HOME/.config/nvim/nconfs/general.vim
source $HOME/.config/nvim/nconfs/mappings.vim
source $HOME/.config/nvim/nconfs/plugConfs/plugins.vim
source $HOME/.config/nvim/nconfs/plugConfs/airline.vim
source $HOME/.config/nvim/nconfs/theme.vim



" Speeds up startup time
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

" autocmd BufWritePre * %s/\s\+$//e "Remove trailing whitespace on save

" " Return to the last edit position when returning to a buffer
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ************** Custom Mapping *****************


" ***********************Plugin Configurations*************************
" Vim- sandwich
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)
" VIM-workspace
let g:workspace_autosave = 0
let g:workspace_autosave_untrailspaces = 0
" Git Messenger
nmap <Leader>m <Plug>(git-messenger)

"fzf
" Ctrl+t to search for a file in the current directory
nnoremap <silent> <expr> <C-t> (len(system('git rev-parse')) ?
            \ ':Files' :
            \ ':call fzf#vim#gitfiles("--cached --exclude-standard --others", fzf#vim#with_preview({"options": ["--info=inline"]}))'
            \ )."\<cr>"

"Vim-Clap
" F3 to search for text in the current directory
nnoremap <F3> :Clap! grep<CR>
nnoremap <C-F3> :Clap! grep ++query=
vnoremap <F3> :Clap! grep ++query=@visual<CR>
nnoremap <F4> :Clap! files<CR>
let g:clap_layout = {'relative': 'editor'}

"vim-Rainbow
let g:rainbow_active = 1

"QuickScope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
let g:qs_buftype_blacklist = ['terminal', 'nofile']

"NerdCommenter
"Toggle comments in source code
let g:NERDToggleCheckAllLines = 1
let g:NERDSpaceDelims = 1

" Add spaces after comment
let g:NERDSpaceDelims = 1
nmap <leader>/ <plug>NERDCommenterToggle
xmap <leader>/ <plug>NERDCommenterToggle



"Coc.nvim

" To get correct comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+


nmap <M-e> :CocCommand explorer<CR>



inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Find all reference
nmap <silent> gr <Plug>(coc-references)
" Rename
nmap <F2> <Plug>(coc-rename)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Apply AutoFix to problem on the current line.
nmap <leader>.  <Plug>(coc-fix-current)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')


" Experiments {{ "
" autocmd Filetype dart nnoremap <F5> :CocCommand flutter.run<CR>
" autocmd Filetype dart nnoremap <F6> :CocCommand flutter.pub.get<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }} "


