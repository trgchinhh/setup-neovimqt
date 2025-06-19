" VIM SETUP BY 
"
"  _______                              _____ _     _       _     
" |__   __|                            / ____| |   (_)     | |    
"    | |_ __ _   _  ___  _ __   __ _  | |    | |__  _ _ __ | |__  
"    | | '__| | | |/ _ \| '_ \ / _` | | |    | '_ \| | '_ \| '_ \ 
"    | | |  | |_| | (_) | | | | (_| | | |____| | | | | | | | | | |
"    |_|_|   \__,_|\___/|_| |_|\__, |  \_____|_| |_|_|_| |_|_| |_|
"                               __/ |                             
"                              |___/                                                                                                                                                                                             
" === PLUGIN CÀI ĐẶT ===
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
set cindent
filetype plugin indent on
set termguicolors  " Bắt buộc để hỗ trợ màu 24-bit

call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " QUAN TRỌNG: Highlight

Plug 'goolord/alpha-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " Dependency cho Telescope
Plug 'folke/persistence.nvim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'chriskempson/base16-vim'

" Tự động đóng dấu ngoặc
Plug 'jiangmiao/auto-pairs'

" Thanh trạng thái Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Hỗ trợ LSP & Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Line dọc canh hàng code  
Plug 'Yggdroot/indentLine'

" Trình quản lý file
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'"

"Plug 'neovim/nvim-lspconfig'

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-tree/nvim-web-devicons'  " nếu dùng GUI hoặc muốn có icon

"Plug 'mhinz/vim-startify'
Plug 'goolord/alpha-nvim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'

call plug#end()

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python' },  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,  
  },
}
EOF

" === CẤU HÌNH COC (tránh xung đột màu) ===
let g:coc_disable_transparent_cursor = 1

" 2. CẤU HÌNH ALPHA.NVIM
lua << EOF
-- Chỉ load khi plugin đã cài đặt
if vim.fn.exists('g:plugs["alpha-nvim"]') == 1 then
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')
  
  dashboard.section.header.val = {
    "████████╗██████╗░██╗░░░██╗░█████╗░███╗░░██╗░██████╗     ░█████╗░██╗░░██╗██╗███╗░░██╗██╗░░██╗",
    "╚══██╔══╝██╔══██╗██║░░░██║██╔══██╗████╗░██║██╔════╝     ██╔══██╗██║░░██║██║████╗░██║██║░░██║",
    "░░░██║░░░██████╔╝██║░░░██║██║░░██║██╔██╗██║██║░░██╗     ██║░░╚═╝███████║██║██╔██╗██║███████║",
    "░░░██║░░░██╔══██╗██║░░░██║██║░░██║██║╚████║██║░░╚██     ██║░░██╗██╔══██║██║██║╚████║██╔══██║",
    "░░░██║░░░██║░░██║╚██████╔╝╚█████╔╝██║░╚███║╚██████╔╝    ╚█████╔╝██║░░██║██║██║░╚███║██║░░██║",
    "░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═╝░░╚══╝░╚═════╝░    ░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚═╝░░╚═╝"
  }

  dashboard.section.buttons.val = {
    dashboard.button("e", "New text file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "Find file in D", ":lua require('telescope.builtin').find_files({cwd = 'D:/'})<CR>"),
    dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("c", "Config init.vim", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "Quit NeoVim", ":qa<CR>"),
}

  dashboard.section.footer.val = "WELCOME CHINH TO NEOVIM !"

  alpha.setup(dashboard.config)
end
EOF

" 3. CẤU HÌNH TELESCOPE (NẾU CẦN)
lua << EOF
if vim.fn.exists('g:plugs["telescope.nvim"]') == 1 then
  require('telescope').setup{}
end
EOF

" 4. TẮT BANNER MẶC ĐỊNH
set shortmess+=I

" 5. TỰ ĐỘNG CÀI ĐẶT KHI KHỞI ĐỘNG (NẾU PLUGIN CHƯA CÓ)
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" === CẤU HÌNH SHELL CHO TERMINAL (MSYS2) ===
"set shell=C:\\msys64\\usr\\bin\\bash.exe
"set shellcmdflag=-c
"set shellquote=
"set shellxquote=

" === GIAO DIỆN ===
syntax enable
set background=dark
"colorscheme onedark
colorscheme dracula
"colorscheme palenight
"colorscheme catppuccin
"colorscheme base16-tomorrow-night-eighties

let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 10

set number
"set guifont=DejaVuSansM\ Nerd\ Font\ Mono:h10
set guifont=Consolas:h11
"set showtabline=2

" === TUỲ CHỈNH MÀU CHO KHUNG GỢI Ý CODE ===
highlight Pmenu guibg=#2e3440 guifg=#ffffff
highlight PmenuSel guibg=#4c566a guifg=#ffffff

" === THAO TÁC BÀN PHÍM ===

" Clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
nnoremap <C-y> "+p
inoremap <C-y> <Esc>"+pa

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
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-S-n> :terminal<CR>

" Toggle NerdTree (Thêm mới)
nnoremap <C-b> :NERDTreeToggle<CR>

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
nnoremap l Vj

" Dòng mới không mất khối chọn
xnoremap <CR> o<Esc>
xnoremap <BS> d

" Di chuyển dòng
nnoremap <C-S-Up> :m-2<CR>==
nnoremap <C-S-Down> :m+<CR>==

" === TỰ ĐỘNG VÀO INSERT MODE ===
" autocmd VimEnter * startinsert

" Tab chọn gợi ý, hoặc dùng như bình thường
inoremap <silent><expr> <Tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<Tab>"

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ "\<C-h>"

" Enter xác nhận gợi ý nếu có
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"


set termguicolors
autocmd VimEnter * call s:setup_lualine()
function! s:setup_lualine() abort
lua<<EOF
require("bufferline").setup{
  options = {
    indicator = {
      style = 'none',
    },
    diagnostics = "coc",
  }
}
EOF
endfunction

highlight BufferLineBufferSelected gui=bold
highlight BufferLineBufferVisible gui=none

highlight BufferLineError gui=bold guifg=#ff5555
highlight BufferLineErrorVisible gui=bold guifg=#ff5555
highlight BufferLineErrorSelected gui=bold guifg=#ff5555

"highlight BufferLineError gui=NONE
"highlight BufferLineErrorVisible gui=NONE
"highlight BufferLineErrorSelected gui=NONE

" === INDENT ===
"let g:indentLine_char = '¦'
let g:indentLine_char = '⎸'
let g:indentLine_enabled = 1

"nnoremap <silent> <F5> :NERDTreeClose<CR>:cd D:/<CR>:NERDTree<CR>
function! ToggleNERDTreeWithCD(path)
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
    :NERDTreeClose
  else
    execute 'cd ' . a:path
    :NERDTree
  endif
endfunction

" Mở D:/ trong NERDTree (F5)
nnoremap <silent> <F5> :call ToggleNERDTreeWithCD('D:/')<CR>
" Mở C:/ trong NERDTree (F6)
nnoremap <silent> <F6> :call ToggleNERDTreeWithCD('C:/')<CR>


function! ToggleTerminal()
    if &buftype ==# 'terminal'
        close
    else
        belowright vsplit | terminal
    endif
endfunction

nnoremap <silent> <F9> :call ToggleTerminal()<CR>
"nnoremap <F11> :GuiWindowFullScreen<CR>

let g:floaterm_position = 'topright'
let g:floaterm_width = 0.5
let g:floaterm_height = 0.6

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Phím tắt <Leader>mm để quay về màn hình chính
nnoremap <silent> <F1> :Alpha<CR>
"lua require("alpha_custom")

" Tìm từ trong file hiện tại bằng :BLines (tìm trong dòng hiện tại)
noremap <silent> ff :BLines<CR>

" Tìm từ trong tất cả file, mặc định thư mục là ổ D:
noremap <silent> F :cd D:/ \| Rg<Space>

vnoremap <silent> ff y:BLines <C-R>"<CR>
vnoremap <silent> F y:cd D:/ \| execute 'Rg ' . shellescape(@")<CR>

" Visual Mode: Tab để thụt vào
vnoremap <Tab> >gv

" Visual Mode: Shift-Tab để thụt ra
vnoremap <S-Tab> <gv

nnoremap <silent> <F9> :FloatermToggle<CR>

" Nếu muốn dùng cả ở chế độ terminal:
tnoremap <silent> <F9> <C-\><C-n>:FloatermToggle<CR>

nmap \rn <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)
