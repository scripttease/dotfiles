call plug#begin('~/.config/nvim/plugged')

Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'scss.css'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'markdown'] }
Plug 'elmcast/elm-vim'
Plug 'honza/vim-snippets'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'slim-template/vim-slim'
Plug 'slime-lang/vim-slime-syntax', { 'for': 'slime' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
Plug 'gleam-lang/gleam.vim'
Plug 'mustache/vim-mustache-handlebars'


call plug#end()

" allow mouse scroll to work
set mouse=a

" spell languages
set spelllang=en

" to set backup directory on new install, mkdir -p ~/.local/share/nvim/tmp
set backupdir=~/.local/share/nvim/tmp   "set backup directory

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set number             " show line numbers
set showcmd            " display incomplete commands
set clipboard+=unnamedplus  " makes copy and paste to OS clipboard once xclip is installed.
" set clipboard=unnamedplus  " makes copy and paste to OS clipboard once xclip is installed.
set clipboard^=unnamed,unnamedplus  " makes copy and paste to OS clipboard once xclip is installed. Now cross-platform

" Faster keypattern to move between open and close braces
nnoremap % ~

" Spell check shortcut
nnoremap :spp<cr> :set spell!<cr>
nnoremap :nos<cr> :set nospell<cr>

" Move between spellings
nnoremap <C-[> [s
nnoremap <C-]> ]s

" Nicer split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Use ESC as ESC in term mode
tnoremap <Esc> <C-\><C-n>

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj
vnoremap j gj
vnoremap k gk
vnoremap <Up> gk
vnoremap <Down> gj
inoremap <Up> <Esc>gki
inoremap <Down> <Esc>gji

" Have Y  behave like D, C, etc (UNTil end of line, not entire line)
nnoremap Y y$

set expandtab
set nojoinspaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Smart case insensitive search
set ignorecase
set smartcase

" / searches before hitting enter
set incsearch

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!


  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

augroup focus
  au!
  " Should auto save on focus change.
  au TabLeave * silent! wall
  au FocusLost * silent! wall
augroup END
set autowriteall

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

let g:snips_author="Alice Dee"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:NERDTreeWinSize=15

function! RubocopThisFile()
  :! rubocop -aD %
endfunction

command! RubocopThisFile call RubocopThisFile()

" Enables JS mocha snippets
autocmd FileType javascript UltiSnipsAddFiletypes javascript-mocha

" Allows node modules etc to be ignored during search
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|node_modules|_build|elm-stuff|coverage|deps|tmp)$',
 \ }

" Go pretty
nnoremap gp :Neoformat<CR>

" Nicer tab navigation
nnoremap <S-left> gT
nnoremap <S-right> gt
inoremap <S-left> <Esc>:tabprev<CR>
inoremap <S-right> <Esc>:tabnext<CR>

