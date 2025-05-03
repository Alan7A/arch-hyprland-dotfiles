syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a
set number
set incsearch
set noshowmode
set termguicolors
set ignorecase
set smartcase
set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

colorscheme tokyonight
hi Normal guibg=NONE ctermbg=NONE

" Vim-Airline settings
let g:tokyonight_enable_italic = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tokyonight'
