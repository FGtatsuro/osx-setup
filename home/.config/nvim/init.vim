syntax on
filetype plugin indent on
set clipboard+=unnamed
set noswapfile
set background=dark
set fileformat=unix
set fileformats=unix,dos
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set completeopt=menuone,preview,noselect
set list

let brew_prefix = system("brew --prefix | tr -d '\n'")
let g:python3_host_prog = $HOME.'/.config/nvim/venv/bin/python'

set tags=tags,./tags;,$HOME/repos/go/tags,$HOME/repos/client-go/tags
