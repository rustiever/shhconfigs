" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
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
Plug 'morhetz/gruvbox'

" ====== Files ======
Plug 'liuchengxu/vim-clap'

" ====== Editor ======
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'wellle/targets.vim'
Plug 'unblevable/quick-scope'

" ====== Git ======
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ====== Helpers ======
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'honza/vim-snippets'
Plug 'thaerkh/vim-workspace'
Plug 'liuchengxu/vim-clap'
Plug 'pechorin/any-jump.vim'

" ====== languages tools ======
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ====== Languages ======
" Dart
Plug 'dart-lang/dart-vim-plugin'
call plug#end()
