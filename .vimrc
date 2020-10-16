call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
  \ 'do' : 'yarn install',
  \ 'for' : ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'html'] }
Plug 'ycm-core/YouCompleteMe'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
call plug#end()

" vimwiki use markdown
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

set nocompatible

" nerdtree
filetype plugin indent on

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|docs'
let g:ctrlp_use_caching = 0

let mapleader=","

set tabstop=2
set softtabstop=2
set shiftwidth=0
set expandtab

" set nofoldenable

" no swap files, may want to revisit this later
set noswapfile

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
map <C-n> :NERDTreeToggle<CR>

" smartcase search
set ignorecase
set smartcase

" center cursor vertically
set scrolloff=99

" always show bottom bar
set laststatus=2
" let g:airline_theme='base16'
set statusline=%F\ %m\ %=\ 0x%04B\ %2c\:%3l\ %3L

" yank goes to system clipboard
set clipboard=unnamedplus

" automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

set clipboard=unnamedplus

" always show gutter
set signcolumn=yes

" Allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier

" Make vim-prettier use prettier defaults
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#jsx_bracket_same_line="false"
let g:prettier#config#parser="babylon"
let g:prettier#config#single_quote="true"
let g:prettier#config#trailing_comma="es5"
let g:prettier#config#semi="false"

" Don't use vim-prettier's auto-formatting
let g:prettier#autoformat=0

" Run prettier async before saving
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.html PrettierAsync
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.html PrettierAsync
autocmd BufWritePre .babelrc,.eslintrc,.prettierrc PrettierAsync

function! s:swap_lines(n1, n2)
  let line1 = getline(a:n1)
  let line2 = getline(a:n2)
  call setline(a:n1, line2)
  call setline(a:n2, line1)
endfunction

function! s:swap_up()
  let n = line('.')
  if n == 1
    return
  endif

  call s:swap_lines(n, n - 1)
  exec n - 1
endfunction

function! s:swap_down()
  let n = line('.')
  if n == line('$')
    return
  endif

  call s:swap_lines(n, n + 1)
  exec n + 1
endfunction

noremap <silent> <c-K> :call <SID>swap_up()<CR>
noremap <silent> <c-J> :call <SID>swap_down()<CR>

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

nnoremap <c-x> :source $MYVIMRC<CR>

let base16colorspace=256
" note: some modifications made to color scheme
colorscheme base16-default-dark

" hide end of buffer tildes
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

set number 

" set window title
set titlestring=
set titlestring+=vim\ 
set titlestring+=%F

" turn off split-based completion preview
set completeopt-=preview

" updtate time for gitgutter
set updatetime=250
let g:airline_powerline_fonts = 1

" save
noremap <silent> <C-w> :update<CR>
vnoremap <silent> <C-w> <C-C>:update<CR>
inoremap <silent> <C-w> <C-O>:update<CR>

" save and quit
nnoremap <C-q> :wq!<cr>
inoremap <C-q> <esc>:wq!<cr>

nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" vimwiki
" nnoremap <C-w> :VimwikiIndex<CR>

let g:rustfmt_autosave = 1

" Generate and open a PDF
set printfont=Courier:h10
  nnoremap <leader>p :hardcopy > ~/print/<C-R>=strftime("%Y%m%d%H%M")<CR>-<C-R>=expand('%:t:r')<CR>.ps <bar> :call system('xdg-open ~/print/<C-R>=strftime("%Y%m%d%H%M")<CR>-<C-R>=expand('%:t:r:gs/\s/\\ /')<CR>.ps')
" nnoremap <leader>p :call system('pandoc <C-R>=expand('%:gs/\s/\\ /')<CR> -o ~/print/<C-R>=strftime("%Y%m%d%H%M")<CR>-<C-R>=expand('%:t:r:gs/\s/\\ /')<CR>.pdf') <bar> :call system('xdg-open ~/print/<C-R>=strftime("%Y%m%d%H%M")<CR>-<C-R>=expand('%:t:r:gs/\s/\\ /')<CR>.pdf')
