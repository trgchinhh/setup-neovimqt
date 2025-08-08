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

set title
let &titlestring = 'Trường Chinh – %t'

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'goolord/alpha-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " Dependency cho Telescope
Plug 'folke/persistence.nvim'

" Theme
"Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Mofiqul/vscode.nvim'
"Plug 'navarasu/onedark.nvim'
Plug 'olimorris/onedarkpro.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " QUAN TRỌNG: Highlight

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

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-tree/nvim-web-devicons'  " nếu dùng GUI hoặc muốn có icon

Plug 'goolord/alpha-nvim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons' " (nên có để có icon đẹp)

" map mini 
"Plug 'echasnovski/mini.nvim'
"Plug 'gorbit99/codewindow.nvim'

" snippet 
"Plug 'neoclide/coc-snippets'

" scrollbar
"Plug 'petertriho/nvim-scrollbar'

call plug#end()

set nocompatible
set termguicolors  " Bắt buộc để hỗ trợ màu 24-bit
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
set cindent
set number
"set guifont=DejaVuSansM\ Nerd\ Font\ Mono:h10.4
"set guifont=Consolas:h11.6
"set guifont=FiraCode\ Nerd\ Font\ Mono:h11
"set guifont=Consolas\ 7NF:h12
set guifont=JetBrains\ Mono:h11


lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'javascript', 'java', 'html'},  
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
    "░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═╝░░╚══╝░╚═════╝░    ░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚═╝░░╚═╝",
    "                                                                                            ",
    "                                AUTHOR: NGUYEN TRUONG CHINH                                 ",
    "                            GITHUB: https://github.com/trgchinhh                            "
  }
  dashboard.section.buttons.val = {
    dashboard.button("e", "New text file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "Find file in D", ":lua require('telescope.builtin').find_files({cwd = 'D:/'})<CR>"),
    dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("c", "Config init.vim", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "Quit NeoVim", ":qa<CR>"),
}

  dashboard.section.footer.val = "WELCOME TO MY NEOVIM SETUP !"

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

" === GIAO DIỆN ===
syntax enable
set background=dark
"colorscheme onedark
"colorscheme dracula
"colorscheme palenight
"colorscheme catppuccin
colorscheme vscode


" Gán lại màu tím cho các từ khóa
highlight Keyword guifg=#C586C0
highlight Function guifg=#C586C0
highlight Define guifg=#C586C0
highlight Type guifg=#C586C0


"vim.api.nvim_set_hl(0, "@function", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@type", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#C586C0" })
"61afef
lua << EOF
vim.api.nvim_set_hl(0, "@keyword.function.python", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "@function", { fg = "#DCDCAA" }) 
vim.api.nvim_set_hl(0, "@keyword", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "@string.escape", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "@character.special", { fg = "#C586C0" })
EOF


" 2D2D30

"highlight Normal       guibg=#2D2D30
"highlight NonText      guibg=#2D2D30
"highlight NormalNC     guibg=#2D2D30
"highlight EndOfBuffer  guibg=#2D2D30
"highlight LineNr       guibg=#2D2D30
"highlight SignColumn   guibg=#2D2D30

" Popup menu (gợi ý tự động)
"highlight Pmenu        guibg=#2D2D30
"highlight Pmenu        guibg=#3C435E
"highlight PmenuSel     guibg=#3C435E "#3A3A3A guifg=#FFFFFF

" Menu scrollbar
"highlight PmenuSbar    guibg=#2D2D30
"highlight PmenuThumb   guibg=#505050

"Floating window (LSP hover, signature help...)
"highlight NormalFloat  guibg=#2D2D30
highlight NormalFloat  guibg= #2D3144 "292D3E "3C435E "2D3144

" Border (nếu có, tuỳ plugin)
"highlight FloatBorder  guibg=#2D2D30 guifg=#606060

" Đổi màu cho thư mục trong NERDTree
"highlight Directory      guifg=#61afef guibg=#2D2D30
"highlight NERDTreeDir    guifg=#61afef guibg=#2D2D30
"highlight NERDTreeOpenable guifg=#61afef guibg=#2D2D30

" Đổi màu cho file thường
"highlight NERDTreeFile   guifg=#abb2bf guibg=#1e1e1e

" Đổi màu cho dấu +/-
"highlight NERDTreeClosable guifg=#e06c75 guibg=#1e1e1e


let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
"set showtabline=1

" === TUỲ CHỈNH MÀU CHO KHUNG GỢI Ý CODE ===
"highlight Pmenu guibg=#2e3440 guifg=#ffffff
"highlight PmenuSel guibg=#4c566a guifg=#ffffff

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

autocmd VimEnter * call s:setup_bufferline()
function! s:setup_bufferline() abort
lua<<EOF
require("bufferline").setup{
  options = {
    indicator = {
      style = 'none',
    },
    diagnostics = 'none',
    separator_style = {"│", "│"},
    show_buffer_close_icons = false,
    show_close_icon = false,
    padding = 2,  -- ← tăng giá trị này làm tab "cao" hơn
    -- Tắt chuột phải đóng tab
    mouse = {
      right = function() end, -- click phải không làm gì
    },
    custom_areas = {
      right = function()
        return {
          { text = "  Buffers  ", fg = "#000000", bg = "#98c379", bold = true },
        }
      end
    },
  },
  highlights = {
    fill = {
      bg = "#1e1e1e" -- màu nền tổng thể của thanh bufferline (match với theme)
    },
    separator = {
      fg = "#61afef",  -- màu xanh dương
      bg = "#262626",  -- nền (giống theme onedark)
    },
    buffer_selected = {
      bg = "#98c379", -- OneDark green
      fg = "#1e1e1e", -- chữ đen cho dễ đọc
      bold = true,
      italic = false, -- ← cái này làm nghiêng
    },
    buffer_visible = {
      fg = "#98c379",   -- chữ sáng
      bg = "#262626",   -- nền tab (OneDark)
      bold = true,
      italic = false,
    },
    buffer = {
      bg = "#262626",
      fg = "#98c379",
      bold = true,
      italic = false,
    },
    modified_selected = {
      fg = "#1e1e1e",
      bg = "#98c379", -- cùng màu với buffer_selected
    },
    modified_visible = {
      fg = "#98c379",
      bg = "#262626", -- cùng màu với buffer_visible
    },
    modified = {
      fg = "#98c379",
      bg = "#262626", -- cùng màu với buffer
    },
  },  
}
EOF
endfunction


" lua << EOF
" require('lualine').setup {
"   options = {
"     theme = 'vscode',
"     section_separators = { left = '', right = '' },
"     component_separators = { left = '', right = '' },
"     icons_enabled = true,
"     always_divide_middle = true,
"   },
"
"   sections = {
"     lualine_a = { 'mode' },
"
"     lualine_b = { 'branch', 'diff' },
"
"     lualine_c = {
"       {
"         'filename',
"         path = 2  -- hiện đường dẫn đầy đủ
"       }
"     },
"
"     lualine_x = {
"       function()
"         local current = vim.fn.line('.')
"         local total = vim.fn.line('$')
"         return string.format('%d/%d', current, total)
"       end,
"
"       function()
"         local ok, result = pcall(vim.fn['CocAction'], 'diagnosticList')
"         if not ok or not result or #result == 0 then return "" end
"
"         local error_count, warning_count = 0, 0
"         local first_error_line, first_warning_line = nil, nil
"
"         for _, item in ipairs(result) do
"           if item.severity == 'Error' then
"             error_count = error_count + 1
"             if not first_error_line or item.lnum < first_error_line then
"               first_error_line = item.lnum
"             end
"           elseif item.severity == 'Warning' then
"             warning_count = warning_count + 1
"             if not first_warning_line or item.lnum < first_warning_line then
"               first_warning_line = item.lnum
"             end
"           end
"         end
"
"         local msg = ""
"         if error_count > 0 then
"           msg = msg .. string.format("Error line %d (%d) ", first_error_line + 1, error_count)
"         end
"         if warning_count > 0 then
"           msg = msg .. string.format("Warning line %d (%d)", first_warning_line + 1, warning_count)
"         end
"
"         return vim.trim(msg)
"       end,
"
"       'encoding',
"       'fileformat',
"       'filetype'
"     },
"
"     lualine_y = { 'progress' },
"
"     lualine_z = {
"       function()
"         return os.date("%H:%M")
"       end
"     },
"   },
"
"   tabline = {
"     lualine_a = {
"       {
"         'buffers',
"         mode = 2,
"         symbols = {
"           modified = ' ●',
"           alternate_file = '#',
"           directory = '',
"         },
"       },
"     },
"     lualine_z = {
"       function() return "Buffers" end
"     }
"   },
"
"   extensions = { 'nvim-tree', 'quickfix', 'fugitive' },
" }
" EOF


"let g:airline#extensions#tabline#enabled = 1


"highlight BufferLineBufferSelected gui=bold
"highlight BufferLineBufferVisible gui=none

"highlight BufferLineError gui=bold guifg=#ff5555
"highlight BufferLineErrorVisible gui=bold guifg=#ff5555
"highlight BufferLineErrorSelected gui=bold guifg=#ff5555

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
"nnoremap <silent> <F6> :call ToggleNERDTreeWithCD('C:/')<CR>
" Mở D:/Github trong NERDTree (F4)
nnoremap <silent> <F4> :call ToggleNERDTreeWithCD('D:/Github')<CR>
" Mở D:/Library_Python trong NERDTree (F7)
"nnoremap <silent> <F7> :call ToggleNERDTreeWithCD('D:/Library_Python')<CR>

"function! ToggleTerminal()
"    if &buftype ==# 'terminal'
"        close
"    else
"        belowright vsplit | terminal 
"    endif
"endfunction

"nnoremap <silent> <F9> :call ToggleTerminal()<CR>
"nnoremap <F11> :GuiWindowFullScreen<CR>

let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Terminal $1/$2'
"augroup FloatermHighlightFix
"  autocmd!
"  autocmd ColorScheme,BufWinEnter,WinEnter,VimEnter * hi Floaterm guibg=#2b2b2b guifg=#ffffff
"  autocmd ColorScheme,BufWinEnter,WinEnter,VimEnter * hi FloatermBorder guibg=#2b2b2b guifg=#98c379
"augroup END

"hi Floaterm        guibg=#2a2a2a
hi Floaterm guibg=Grey15
"hi FloatermBorder  guibg=#2a2a2a
hi FloatermBorder guifg=White guibg=#98c379 gui = bold


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Phím tắt <Leader>mm để quay về màn hình chính
nnoremap <silent> <F1> :Alpha<CR>
"lua require("alpha_custom")

" Màu sắc cho FZF
hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=5
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=6
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3

let g:fzf_colors = {
    \ 'fg':      ['fg', 'fzf_fg'],
    \ 'hl':      ['fg', 'fzf_hl'],
    \ 'fg+':     ['fg', 'fzf_fgp'],
    \ 'hl+':     ['fg', 'fzf_hlp'],
    \ 'info':    ['fg', 'fzf_info'],
    \ 'prompt':  ['fg', 'fzf_prompt'],
    \ 'pointer': ['fg', 'fzf_pointer'],
    \ 'spinner': ['fg', 'fzf_spinner'] }

" Layout FZF
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.6, 'border': 'rounded' } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Command tìm file với preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': [
    \ '--layout=reverse', '--info=inline', '--border', '--preview-window=right:50%'
    \ ]}), <bang>0)

" Command tìm trong file hiện tại
command! -bang BLines
    \ call fzf#vim#buffer_lines(<bang>0)

" Map phím
nnoremap <silent> <F6> :BLines<CR>
nnoremap <silent> <F7> :cd D:/ \| Files<CR>

" Tìm từ trong file hiện tại bằng :BLines (tìm trong dòng hiện tại)
"noremap <silent> ff :BLines<CR>

" Tìm từ trong tất cả file, mặc định thư mục là ổ D:
"noremap <silent> F :cd D:/ \| Rg<Space>


"vnoremap <silent> ff y:BLines <C-R>"<CR>
"vnoremap <silent> F y:cd D:/ \| execute 'Rg ' . shellescape(@")<CR>

" Visual Mode: Tab để thụt vào
vnoremap <Tab> >gv

" Visual Mode: Shift-Tab để thụt ra
vnoremap <S-Tab> <gv

" Terminal
function! ToggleFixedDTerminal()
    let l:term_name = 'term_d_drive'
    let l:term_path = 'D:/'

    " Nếu terminal chưa có, tạo mới tại ổ D
    if floaterm#terminal#get_bufnr(l:term_name) == -1
        execute 'FloatermNew --cwd=' . fnameescape(l:term_path) . ' --name=' . l:term_name
    else
        " Toggle terminal đã tạo
        execute 'FloatermToggle ' . l:term_name
    endif
endfunction

nnoremap <silent> <F9> :call ToggleFixedDTerminal()<CR>
tnoremap <silent> <F9> <C-\><C-n>:call ToggleFixedDTerminal()<CR>

nmap \rn <Plug>(coc-rename)
"nmap <leader>rn <Plug>(coc-rename)
let g:Illuminate_use_highlight = 0
vnoremap ? :Commentary<CR>
set statusline+=%{FugitiveHead()}
" Hiện branch Git ở statusline
"set statusline=%f\ %h%m%r\ %{FugitiveHead()}

