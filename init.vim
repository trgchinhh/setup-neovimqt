call plug#begin('~/.vim/plugged')

" Cài đặt theme One Dark
Plug 'joshdick/onedark.vim'
" Cài đặt plugin auto-pairs
Plug 'jiangmiao/auto-pairs'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Cấu hình theme
syntax enable
set background=dark
colorscheme onedark

" Enable clipboard support (requires Vim to be compiled with +clipboard)
set clipboard=unnamedplus

" Map Ctrl+C to copy (copy selected text to clipboard)
vnoremap <C-c> "+y

" Map Ctrl+V to paste (paste from clipboard)
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa

" Map Ctrl+Z to undo
nnoremap <C-z> u
inoremap <C-z> <Esc>u

" Map Ctrl+Y to redo
nnoremap <C-y> <C-r>
inoremap <C-y> <Esc><C-r>

" Map Ctrl+S to save the file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Map Ctrl+Q to quit Neovim
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>

" Map Ctrl+Shift+T to open a new tab (if you're using tabpages)
nnoremap <C-S-t> :tabnew<CR>

" Map Ctrl+P to open file (similar to editor search file)
nnoremap <C-p> :Telescope find_files<CR>

" Map Ctrl+Shift+W to close a tab (if you're using tabpages)
nnoremap <C-S-w> :tabclose<CR>

" Map Ctrl+Shift+N to open a terminal window inside Neovim
nnoremap <C-S-n> :terminal<CR>

" Map Ctrl+H, Ctrl+J, Ctrl+K, Ctrl+L for window navigation (like tmux)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Gán Ctrl+A để chọn tất cả nội dung trong file
nnoremap <C-a> ggVG
" Sử dụng 4 spaces thay vì Tab
set tabstop=4       " Độ dài của Tab
set shiftwidth=4    " Số spaces khi indent
set expandtab       " Sử dụng spaces thay vì tab khi nhấn Tab
set softtabstop=4   " Sử dụng 4 spaces khi nhấn Tab trong chế độ Insert
" Tự động indent khi soạn thảo
set smartindent
set autoindent
set cindent
" Gán Ctrl+X để cut (cắt text vào clipboard)
vnoremap <C-x> "+d

" Gán Ctrl+Y để paste (dán từ clipboard vào)
nnoremap <C-y> "+p
inoremap <C-y> <Esc>"+pa

" Khởi động Neovim ở Insert mode
autocmd VimEnter * startinsert

" Đảo ngược hành vi của phím Esc để vào Normal mode lần đầu tiên
let g:esc_in_insert_mode = 1
inoremap <Esc> <Esc>:call ToggleInsertNormal()<CR>
nnoremap <Esc> :call ToggleInsertNormal()<CR>

" Hàm toggle chuyển giữa Insert mode và Normal mode
function! ToggleInsertNormal()
  if g:esc_in_insert_mode == 1
    " Nếu đang ở Insert mode, chuyển sang Normal mode
    normal!
    let g:esc_in_insert_mode = 0
  else
    " Nếu đang ở Normal mode, chuyển lại Insert mode
    startinsert
    let g:esc_in_insert_mode = 1
  endif
endfunction

" Map Ctrl+A để chọn tất cả (Select All) trong Insert mode
inoremap <C-a> <Esc>ggVG
" Map Ctrl+L để bôi đen dòng hiện tại
nnoremap <C-l> V
inoremap <C-l> <Esc>V
" Map Ctrl+L và mỗi lần nhấn 'l' thêm 1 dòng để bôi đen tiếp
nnoremap <C-l> V
nnoremap l Vj
" Xóa khối bôi đen khi nhấn Backspace (Giống Sublime Text)
xnoremap <BS> d

" Tạo dòng mới mà không mất khối khi nhấn Enter
xnoremap <CR> o<Esc>
" Set font and size for GUI Neovim (Neovim-Qt, GVim)
set guifont=Consolas:h11
" Move selected line up
nnoremap <C-S-Up> :m-2<CR>==
" Move selected line down
nnoremap <C-S-Down> :m+<CR>==
" Hiển thị số dòng
set number
