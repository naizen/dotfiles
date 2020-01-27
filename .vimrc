call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors' " Multi cursor select
Plug 'sheerun/vim-polyglot' " Syntax highlighting
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

" Javascript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Colors
Plug 'vim-scripts/desert-warm-256'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'mhartington/oceanic-next'

call plug#end()

" Key mappings
imap jk <Esc>
map <C-o> :NERDTreeToggle<CR>
nnoremap <C-p> :CtrlP<CR>

" Change cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2

syntax enable
set t_Co=256

if (has("termguicolors"))
	set termguicolors
endif

colorscheme OceanicNext

" Faster CtrlP
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Run prettier before saving async
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
