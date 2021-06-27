" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'daviesjamie/vim-base16-lightline'
" Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-json',
      \ ]
" Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'michal-h21/vim-zettel'
" Plug 'michal-h21/vimwiki-sync'
call plug#end()

set nocompatible

" use space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" save file
map <Leader>s :update<CR>

" quit file
map <Leader>q :q<CR> 

" nerdtree
filetype plugin on
syntax on

" yank goes to system clipboard
set clipboard=unnamedplus  

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set incsearch
set hlsearch
" Clear highlighting for the current search with <Leader>/
" Adapted from https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting/657484#657484
nnoremap <Leader>/ :let @/=""<Return>

set cursorline

set title

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" nerdtree shortuct
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalUI=1
" open nerdtree on enter
" autocmd VimEnter * NERDTree
" autocmd VimEnter * if argc() | wincmd p | endif
" always show hidden files
let NERDTreeShowHidden=1
map <Leader>n :NERDTreeToggle<CR>
" find current file in nerdtree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>


" smartcase search
set ignorecase
set smartcase

" center cursor vertically
set scrolloff=99

" set statusline=%F\ %m\ %=\ 0x%04B\ %2c\:%3l\ %3L
set laststatus=2

" lightline themw
let g:lightline = {
\   'colorscheme': 'base16'
\ }

" automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

" fold settings for vimwiki
nnoremap <Leader>t za

" Allow JSX in .js files
let g:jsx_ext_required=0

nmap <Leader>h <c-w>h
nmap <Leader>l <c-w>l
nmap <Leader>j <c-w>j
nmap <Leader>k <c-w>k

nnoremap <Leader>x :source $MYVIMRC<CR>

set background=dark
let base16colorspace=256
colorscheme base16-default-dark

" show line numbers
:set number
:highlight LineNr ctermbg=bg guibg=bg
hi CursorLineNr term=bold cterm=bold gui=bold ctermbg=bg

" always show gutter
set signcolumn=yes

highlight SignColumn guibg=bg ctermbg=bg
let g:gitgutter_set_sign_backgrounds = 1

" hide end of buffer tildes
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" set window title
set titlestring=
set titlestring+=vim\ 
set titlestring+=%F

" set folds
set foldmethod=syntax
set foldlevel=99
let g:vimwiki_folding = 'list'

" set undo file
set undodir=~/.vim/undo-dir
set undofile

" vimwiki syntax markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]

" file search
map <Leader>p :GitFiles<CR>
map <Leader>e :Files<CR>
" string search (ripgrep must be installed)
" map <Leader>f :Rg<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'Normal'],
      \ 'hl': ['fg', 'Comment'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Statement'],
      \ 'info': ['fg', 'PreProc'],
      \ 'border': ['fg', 'Ignore'],
      \ 'prompt': ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker': ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header': ['fg', 'Comment'] }

" reload files in case i have them open across multiple instances
" check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
" disable swapfile to avoid errors on load
set noswapfile

" Switched to coc, config is under :CocConfig
" COC settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>j <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>k <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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

" folded style settings
hi! Folded ctermfg=green guifg=green
set fillchars=fold:\ 
set foldopen-=hor

" vimwiki toggle todo state
nmap <leader>d <Plug>VimwikiToggleListItem

" disable coc autosuggest in markdown, vimwiki file
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType vimwiki let b:coc_suggest_disable = 1
