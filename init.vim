" VIM SETUP BY 
"
"    ______                                ________    _       __  
"   /_  __/______  ______  ____  ____ _   / ____/ /_  (_)___  / /_ 
"    / / / ___/ / / / __ \/ __ \/ __ `/  / /   / __ \/ / __ \/ __ \
"   / / / /  / /_/ / /_/ / / / / /_/ /  / /___/ / / / / / / / / / /
"  /_/ /_/   \__,_/\____/_/ /_/\__, /   \____/_/ /_/_/_/ /_/_/ /_/ 
"                             /____/                                                                                                                                                                                                                            

" === PLUGIN CÀI ĐẶT ===
call plug#begin('~/.vim/plugged')

" Theme One Dark
Plug 'joshdick/onedark.vim'

" Tự động đóng dấu ngoặc
Plug 'jiangmiao/auto-pairs'

" Thanh trạng thái Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" (Tùy chọn) Hỗ trợ LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Line dọc canh hàng code  
Plug 'Yggdroot/indentLine'

call plug#end()

" === GIAO DIỆN ===
syntax enable
set background=dark
colorscheme onedark
set number                    " Hiển thị số dòng
set guifont=Consolas:h11      " Font GUI (GVim, Neovim-Qt)

" === THIẾT LẬP THAO TÁC BÀN PHÍM ===

" Clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y            " Copy
vnoremap <C-x> "+d            " Cut
nnoremap <C-v> "+p            " Paste (Normal)
inoremap <C-v> <Esc>"+pa      " Paste (Insert)
nnoremap <C-y> "+p            " Paste (Normal)
inoremap <C-y> <Esc>"+pa      " Paste (Insert)

" Undo / Redo
nnoremap <C-z> u
inoremap <C-z> <Esc>u
nnoremap <C-y> <C-r>
inoremap <C-y> <Esc><C-r>

" Save / Quit / Tab
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>
nnoremap <C-S-t> :tabnew<CR>
nnoremap <C-S-w> :tabclose<CR>
nnoremap <C-p> :Telescope find_files<CR>    " Mở tìm file (cần Telescope)
nnoremap <C-S-n> :terminal<CR>              " Mở Terminal

" Di chuyển giữa các cửa sổ
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Chọn tất cả và chọn dòng
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
nnoremap <C-l> V
inoremap <C-l> <Esc>V
nnoremap l Vj                " Tiếp tục chọn dòng khi nhấn `l`

" Dòng mới không mất khối chọn (Enter)
xnoremap <CR> o<Esc>
xnoremap <BS> d              " Xóa khối bôi đen với Backspace

" Di chuyển dòng lên/xuống
nnoremap <C-S-Up> :m-2<CR>==
nnoremap <C-S-Down> :m+<CR>==

" === TỰ ĐỘNG CHUYỂN INSERT/NORMAL ===

" Vào Insert mode khi mở file
autocmd VimEnter * startinsert

" Toggle giữa Insert và Normal bằng phím Esc
let g:esc_in_insert_mode = 1
inoremap <Esc> <Esc>:call ToggleInsertNormal()<CR>
nnoremap <Esc> :call ToggleInsertNormal()<CR>

function! ToggleInsertNormal()
  if g:esc_in_insert_mode == 1
    normal!
    let g:esc_in_insert_mode = 0
  else
    startinsert
    let g:esc_in_insert_mode = 1
  endif
endfunction

" === THIẾT LẬP INDENT ===
set tabstop=4         " Độ dài 1 tab = 4 spaces
set shiftwidth=4      " Thụt vào khi auto-indent = 4
set expandtab         " Dùng spaces thay vì tab
set softtabstop=4     " Khi nhấn Tab, chèn 4 spaces
set smartindent       " Tự indent thông minh
set autoindent        " Tự động indent dòng mới
set cindent           " Hỗ trợ indent kiểu C/C++
let g:indentLine_char = '│' " Hỗ trợ line sau mỗi tab
let g:indentLine_enabled = 1 

