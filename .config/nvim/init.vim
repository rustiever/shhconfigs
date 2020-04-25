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
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    " Download VIM-plug
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

" ====== Appearance ======
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'frazrepo/vim-rainbow'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'rakr/vim-one'

" ====== Files ======
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap'

" ====== Editor ======
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'wellle/targets.vim'
Plug 'unblevable/quick-scope'

" ====== Git ======
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'

" ====== Helpers ======
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'thaerkh/vim-workspace'
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vista.vim'

" ====== languages tools ======
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ====== Languages ======
" Dart
Plug 'dart-lang/dart-vim-plugin'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

""""""Looks
set termguicolors
colorscheme one
let g:one_allow_italics = 1 " italics comments

"" Basic Configurations
set nocompatible
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent copyindent smartindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd
set list listchars=trail:»,tab:»-
set nowrap
set encoding=utf-8
set number
set title
set mouse=a " mouse support in all modes
set noshowmode " Hide INSERT/VISUAL messages
set lazyredraw " Don't redraw while performing a macro
set clipboard+=unnamedplus
set textwidth=79
set formatoptions=tcqrn1
set noshiftround
set confirm
set undodir=~/.local/share/nvim/undodir
set undofile
set backspace=indent,eol,start " Fix backspace indentt
au CursorHold * checktime

let mapleader ="\<Space>" " leader key



autocmd BufWritePre * %s/\s\+$//e "Remove trailing whitespace on save

" Return to the last edit position when returning to a buffer
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ************** Custom Mapping *****************

" Alias replace all to S
nnoremap S :%s//gI<Left><Left><Left>
" esc key to go normal mode in terminal
tnoremap <Esc> <C-\><C-n>
"to quit file
nnoremap <leader>q :wq<CR>
"to save file
nnoremap <Leader>w :w<CR>
" *** Buffer Mapping ***
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>k :bfirst<CR>
nnoremap <Leader>j :blast<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <F10> :ls<CR>
"********************************

" Coc-config file
nnoremap <F12> :CocConfig<CR>
" init.vim/vimrc
nnoremap <F9> :e ~/.config/nvim/init.vim<CR>
"remove highlighting
nnoremap <leader><leader> :nohlsearch<CR>
"fuzzy finding
nnoremap <leader>z :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

"split configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow splitright
" Go to the first non-blank character of a line
noremap 0 ^
" Just in case you need to go to the very beginning of a line
noremap ^ 0

" Map jj to escape so that you can exit insert mode easily
inoremap jj <Esc>

" Reload VIM RC
command! Reloadrc source $MYVIMRC
nnoremap <leader>rr :Reloadrc<cr>

" Move buffers
nnoremap gb :bprevious<CR>
nnoremap gn :bnext<CR>

" Move around in insert mode, handy with auto insert braces etc.
inoremap <M-l> <right>
inoremap <M-h> <left>

" ***********************Plugin Configurations*************************
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
nmap <leader>/ <plug>NERDCommenterToggle
xmap <leader>/ <plug>NERDCommenterToggle

"Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='random'
let g:airline_theme = 'one'
let g:airline#extensions#tabline#enabled = 1

"Vista
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }


"Coc.nvim

nmap <M-t> :CocCommand explorer<CR>

"experiment
" Complete with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
