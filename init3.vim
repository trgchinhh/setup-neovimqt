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
let &titlestring = 'Truong Chinh – %t'

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'goolord/alpha-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " Dependency cho Telescope
Plug 'folke/persistence.nvim'

" Theme
Plug 'joshdick/onedark.vim'
"Plug 'Mofiqul/dracula.nvim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Mofiqul/vscode.nvim'
"Plug 'navarasu/onedark.nvim'
"Plug 'olimorris/onedarkpro.nvim'

"Plug 'kaiuri/nvim-juliana'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " QUAN TRỌNG: Highlight

" Tự động đóng dấu ngoặc
Plug 'jiangmiao/auto-pairs'

" Thanh trạng thái Airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

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
"set guifont=JetBrains\ Mono\ Medium:h11

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'javascript', 'java', 'html', 'css', 'scss'},  
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
syntax on
set background=dark
"colorscheme onedark
"colorscheme dracula
"colorscheme palenight
"colorscheme catppuccin
colorscheme vscode
"colorscheme mariana
"colorscheme juliana

" Gán lại màu tím cho các từ khóa
highlight Keyword guifg=#C586C0
highlight Function guifg=#C586C0
highlight Define guifg=#C586C0
highlight Type guifg=#C586C0

"highlight NERDTreeDir guifg=#e5c07b " màu chữ folder
"highlight NERDTreeDirSlash guifg=#e06c75  "màu dấu /
"highlight Directory guifg=#e5c07b  " màu dấu + 

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

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 2D2D30

"highlight Normal       guibg=#323232
"highlight NonText      guibg=#2D2D30
"highlight NormalNC     guibg=#2D2D30
"highlight EndOfBuffer  guibg=#2D2D30
"highlight LineNr       guibg=#2D2D30
"highlight SignColumn   guibg=#2D2D30

" Popup menu (gợi ý tự động)
"highlight Pmenu        guibg=#2D2D30
"highlight Pmenu        guibg=#61AFEF "#3C435E
highlight PmenuSel     guibg=#007ACC "#61AFEF
highlight CocMenuSel   guibg=#007ACC guifg= #FFFFFF
highlight CocMenu      guifg=#FFFFFF guibg=#3E4452

" Menu scrollbar
highlight PmenuSbar    guibg=#3C414E
highlight PmenuThumb   guibg=#FFFFFF

"Floating window (LSP hover, signature help...)
"highlight NormalFloat  guibg=#2D2D30
"#3C414E  "#2D3144 "292D3E "3C435E "2D3144 "#3E4452
highlight NormalFloat  guibg= #3E4452  guifg = #FFFFFF

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

"let g:airline_theme = 'onedark'
"let g:airline_powerline_fonts = 1
"set showtabline=1

" === TUỲ CHỈNH MÀU CHO KHUNG GỢI Ý CODE ===
"highlight Pmenu guibg=#2e3440 guifg=#ffffff
"highlight PmenuSel guibg=#4c566a guifg=#ffffff

hi SpecialKey guifg=#FFFFFF


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

" Di chuyển khối đang chọn trong Visual mode
xnoremap <C-S-Up> :m '<-2<CR>gv=gv
xnoremap <C-S-Down> :m '>+1<CR>gv=gv

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


" t + mũi tên để di chuyển giữa các tab 
let g:buffer_move_mode = 0
function! ToggleBufferMoveMode()
  if g:buffer_move_mode
    let g:buffer_move_mode = 0
    echo "Buffer Move Mode OFF"
    nunmap <Right>
    nunmap <Left>
  else
    let g:buffer_move_mode = 1
    echo "Buffer Move Mode ON"
    nnoremap <Right> :bnext<CR>
    nnoremap <Left>  :bprevious<CR>
  endif
endfunction
nnoremap <silent>t :call ToggleBufferMoveMode()<CR>


lua << EOF
local colors = {
  warning_bg = '#D7BA7D', -- vàng giống VSCode warning
  error_bg   = '#F44747', -- đỏ giống VSCode error
  fg         = '#ffffff',
}
require('lualine').setup {
  options = {
    theme = "vscode",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    icons_enabled = true,
    always_divide_middle = false,
    globalstatus = true,
  },  

  sections = {
    lualine_a = { 'mode' },

    lualine_b = {
      {
        'branch',
        color = { fg = "#FFFFFF", bg = nil }, -- chữ trắng
        separator = '' -- bỏ separator mặc định
      },
      {
        function() return '' end, -- dấu ngăn
        color = { fg = nil, bg = nil }, -- màu trắng
        padding = { left = 0, right = 0 },
      },
      {
        'diff',
        color = { fg = nil, bg = nil },
        separator = ''
      },
      -- 
      {
        function() return '' end,
        color = { fg = "#FFFFFF", bg = nil },
        padding = { left = 0, right = 0 },
      },
    },

    lualine_c = {
      {
        'filename',
        path = 2,  -- hiển thị relative path từ cwd
        symbols = {
          modified = ' [+]',
          readonly = ' [Read Only]',
          unnamed = '[No Name]',
        },
        color = { fg = '#ffffff', bg = nil },  -- chữ trắng, nền trong suốt
        -- separator = { right = '' },  -- nếu muốn dùng separator
      }
    },

    lualine_x = {
      {
        'filetype',
        icons_enabled = false, -- tắt icon
      },
    },

    lualine_y = {
      -- Mũi tên sang trái ()
      {
        function() return '' end,
        color = { fg = "#FFFFFF", bg = nil },  -- fg = nền UTF-8, bg = nền bên trái
        padding = { left = 0, right = 0 },
      },
      -- Phần encoding + fileformat
      {
        function()
          local enc = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
          local ff = vim.bo.ff
          local ff_icon = ''
          if ff == 'unix' then
            ff_icon = ''  -- Linux
          elseif ff == 'dos' then
            ff_icon = ''  -- Windows
          elseif ff == 'mac' then
            ff_icon = ''  -- Mac
          end
          return string.format('%s [%s]', enc, ff)
        end,
        color = { fg = "#FFFFFF", bg = nil }, -- nền của UTF-8
        separator = '',
      },
    }, 

    lualine_z = {
      'progress',

      -- Vị trí dòng/cột
      function()
        local current = vim.fn.line('.')
        local total = vim.fn.line('$')
        local col = vim.fn.col('.')
        return string.format('\u{E0A1}: %d/%d \u{E0B3} @ %d', current, total, col)
      end,

      -- Warning count
      {
        function()
          local ok, result = pcall(vim.fn['CocAction'], 'diagnosticList')
          if not (ok and result and #result > 0) then return '' end
          local warning_count, first_warning_line = 0, nil
          for _, item in ipairs(result) do
            if item.severity == 'Warning' then
              warning_count = warning_count + 1
              if not first_warning_line or item.lnum < first_warning_line then
                first_warning_line = item.lnum
              end
            end
          end
          if warning_count > 0 then
            return string.format('W:%d (L%d)', warning_count, first_warning_line)
          end
          return ''
        end,
        color = { fg = colors.fg, bg = colors.warning_bg },
        separator = { left = '' }
      },

      -- Error count
      {
        function()
          local ok, result = pcall(vim.fn['CocAction'], 'diagnosticList')
          if not (ok and result and #result > 0) then return '' end
          local error_count, first_error_line = 0, nil
          for _, item in ipairs(result) do
            if item.severity == 'Error' then
              error_count = error_count + 1
              if not first_error_line or item.lnum < first_error_line then
                first_error_line = item.lnum
              end
            end
          end
          if error_count > 0 then
            return string.format('E:%d (L%d)', error_count, first_error_line)
          end
          return ''
        end,
        color = { fg = colors.fg, bg = colors.error_bg },
        separator = { left = '' }
      },
    },
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 2,
        symbols = {
          modified = ' ●',
          alternate_file = '#',
          directory = '',
        },
      },
    },
    lualine_z = {
      function() return "Buffers" end
    },
  },

  extensions = { 'nvim-tree', 'quickfix', 'fugitive' },
}
EOF


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

" Tự động cd vào thư mục chứa file hiện tại
autocmd BufEnter * silent! lcd %:p:h

"function! ToggleNERDTreeFind()
"  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
"    " Nếu NERDTree đang mở -> tắt nó
"    execute 'NERDTreeClose'
"  else
"    " Nếu chưa mở -> mở và focus file hiện tại
"    execute 'NERDTreeFind'
"  endif
"endfunction

" Map F5
"nnoremap <silent> <F5> :call ToggleNERDTreeFind()<CR>

" Mở D:/ trong NERDTree (F5)
nnoremap <silent> <F5> :call ToggleNERDTreeWithCD('D:/')<CR>
" Mở C:/ trong NERDTree (F6)
"nnoremap <silent> <F6> :call ToggleNERDTreeWithCD('C:/')<CR>
" Mở D:/Github trong NERDTree (F4)
nnoremap <silent> <F4> :call ToggleNERDTreeWithCD('D:/Github')<CR>

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
"hi FloatermBorder  guibg=#2a2a2a
"hi FloatermBorder guifg=Black guibg=#1abc9a gui = bold
"hi FloatermBorder guifg=White guibg=1e1e1e 
hi Floaterm guibg=Grey15
"hi FloatermBorder guifg=Orange guibg=DarkGreen
" orange  = "#d19a66",
" yellow  = "#e5c07b",
hi FloatermBorder guifg=Black guibg=#3ECEB3 gui=bold "#d19a66 "#D7BA7D "#3ECEB3 

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
hi! fzf_border ctermfg=6

" Layout FZF
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.6, 'border': 'rounded' } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(white)%C(bold)%cr"'

let g:fzf_colors = {
    \ 'fg':      ['fg', 'fzf_fg'],
    \ 'hl':      ['fg', 'fzf_hl'],
    \ 'fg+':     ['fg', 'fzf_fgp'],
    \ 'hl+':     ['fg', 'fzf_hlp'],
    \ 'info':    ['fg', 'fzf_info'],
    \ 'prompt':  ['fg', 'fzf_prompt'],
    \ 'pointer': ['fg', 'fzf_pointer'],
    \ 'spinner': ['fg', 'fzf_spinner'],
    \ 'border':  ['fg', 'fzf_border'] }

" Command tìm file với preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Command tìm trong file hiện tại
command! -bang BLines
    \ call fzf#vim#buffer_lines(<bang>0)

" Map phím
nnoremap <silent> <F6> :BLines<CR>
"nnoremap <silent> <F7> :cd D:/ \| Files<CR>
"nnoremap <silent> <F7> :cd D:/ \| Rg<Space>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
map <F7> :Rg<CR>

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
"if has('win32')
"  let g:floaterm_shell = 'powershell -nologo'
"endif
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

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
