set encoding=UTF-8
set number  "show linenumber
filetype on  "check file type
set background=dark  "背景使用黑色
syntax on  "开启语法高亮
set autoindent  "自动缩进,vim使用自动对起，也就是把当前行的对起格式应用到下一行
set smartindent "依据上面的对起格式，智能的选择对起方式
set textwidth=79  " lines longer than 79 columns will be broken"
set tabstop=4   "设置tab键为4个空格
set shiftwidth=4  "设置当行之间交错时使用4个空格
set softtabstop=4  " insert/delete 4 spaces when hitting a TAB/BACKSPACE"
set shiftround     " round indent to multiple of 'shiftwidth'"
set expandtab
set smarttab
set showmatch  "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set ruler  "在编辑过程中，在右下角显示光标位置的状态行
set incsearch "搜索设置


" vim-Plug start
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


" vim-Plug end
call plug#end()


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

" indentLine
let g:indentLine_leadingSpaceEnabled = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" lightline
if !has('gui_running')
  set t_Co=256
endif

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set laststatus=2
"let g:lightline = {
""      \ 'colorscheme': 'powerline',
""      \ 'active': {
""      \   'left': [ [ 'mode', 'paste' ],
""      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
""      \ },
""      \ 'component_function': {
""      \   'cocstatus': 'coc#status',
""      \   'currentfunction': 'CocCurrentFunction'
""      \ },
""      \ }

let g:molokai_original = 1
let g:rehash256 = 1

colorscheme molokai

" NERDTree
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

