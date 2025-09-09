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
"let &titlestring = 'Truong Chinh – %t'
let &titlestring = 'Truong Chinh'

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'goolord/alpha-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " Dependency cho Telescope
Plug 'folke/persistence.nvim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
"Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Mofiqul/vscode.nvim'
"Plug 'navarasu/onedark.nvim'
"Plug 'olimorris/onedarkpro.nvim'
"Plug 'morhetz/gruvbox'

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
Plug 'airblade/vim-gitgutter'                 " Git show changes

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons' " (nên có để có icon đẹp)

" map mini 
"Plug 'echasnovski/mini.nvim'
"Plug 'gorbit99/codewindow.nvim'

Plug 'kdheepak/lazygit.nvim'

" Các plugin dependency
Plug 'nvim-lua/plenary.nvim'

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
"set guifont=DejaVuSansM\ Nerd\ Font\ Mono:h12
"set guifont=Consolas:h11.6
"set guifont=FiraCode\ Nerd\ Font\ Mono:h11
"set guifont=Consolas\ 7NF:h11.5
set guifont=JetBrains\ Mono:h11.1
"set guifont=JetBrains\ Mono\ Medium:h11.1

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
"let g:coc_disable_transparent_cursor = 1

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
    dashboard.button("f", "Find file in D:", ":lua require('telescope.builtin').find_files({cwd = 'D:/'})<CR>"),
    dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
    --dashboard.button("t", "Open terminal", ":terminal cmd /k \"cd /d D:\\\"<CR>"),
    dashboard.button("t", "Open terminal", ':terminal powershell -NoExit -Command "Set-Location D:\\;"<CR>:startinsert<CR>'),
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
colorscheme onedark
"colorscheme dracula
"colorscheme palenight
"colorscheme catppuccin
"colorscheme vscode


lua << EOF
local colors = {
  black   = "#282c34",
  fg      = "#abb2bf",
  comment = "#5c6370",
  red     = "#e06c75",
  orange  = "#d19a66",
  yellow  = "#e5c07b",
  green   = "#98c379",
  cyan    = "#56b6c2",
  blue    = "#61afef",
  purple  = "#c678dd",
}

-- Comments
vim.api.nvim_set_hl(0, "@comment", { fg = colors.comment, italic = false })
vim.api.nvim_set_hl(0, "@comment.todo", { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, "@comment.error", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "@comment.warning", { fg = colors.orange, bold = true })

-- Variables
vim.api.nvim_set_hl(0, "@variable", { fg = colors.red })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = colors.red })
vim.api.nvim_set_hl(0, "@variable.member", { fg = colors.red })
vim.api.nvim_set_hl(0, "@field", { fg = colors.red })
vim.api.nvim_set_hl(0, "@property", { fg = colors.red })

-- Constants
vim.api.nvim_set_hl(0, "@constant", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.macro", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.enum", { fg = colors.cyan })

-- Types & classes
vim.api.nvim_set_hl(0, "@type", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.definition", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.class", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "@type.enum", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@namespace", { fg = colors.yellow })

-- Functions
vim.api.nvim_set_hl(0, "@function", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.call", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.method", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.cyan })

-- Keywords & control flow
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.exception", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.type", { fg = colors.yellow })

-- Preprocessor / include / import (One Dark Pro = xanh dương)
vim.api.nvim_set_hl(0, "@keyword.import", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@include", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@preproc", { fg = colors.blue })

-- Literals
vim.api.nvim_set_hl(0, "@string", { fg = colors.green })
vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@character", { fg = colors.green })
vim.api.nvim_set_hl(0, "@number", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@boolean", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@float", { fg = colors.orange })

-- Operators & punctuation
vim.api.nvim_set_hl(0, "@operator", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@punctuation", { fg = colors.fg })

-- Tags (HTML/JSX)
vim.api.nvim_set_hl(0, "@tag", { fg = colors.red })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = colors.fg })

-- Annotations / decorators
vim.api.nvim_set_hl(0, "@attribute", { fg = colors.cyan, italic = true })
vim.api.nvim_set_hl(0, "@decorator", { fg = colors.cyan, italic = true })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.orange })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })

-- JSON, YAML, TOML
vim.api.nvim_set_hl(0, "@label.json", { fg = colors.red })
vim.api.nvim_set_hl(0, "@field.yaml", { fg = colors.red })
vim.api.nvim_set_hl(0, "@property.toml", { fg = colors.red })

-- Markdown
vim.api.nvim_set_hl(0, "@text.title", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "@text.strong", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "@text.emphasis", { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, "@text.uri", { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, "@text.literal", { fg = colors.green })
vim.api.nvim_set_hl(0, "@text.quote", { fg = colors.comment, italic = true })

-- HTML, CSS
vim.api.nvim_set_hl(0, "@tag.html", { fg = colors.red })
vim.api.nvim_set_hl(0, "@attribute.html", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@property.css", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@string.css", { fg = colors.green })

vim.api.nvim_set_hl(0, "@module.cpp", { fg = colors.yellow })
EOF


lua << EOF
-- One Dark Pro colors
local colors = {
  black   = "#282c34",
  fg      = "#abb2bf",
  comment = "#5c6370",
  red     = "#e06c75",
  orange  = "#d19a66",
  yellow  = "#e5c07b",
  green   = "#98c379",
  cyan    = "#56b6c2",
  blue    = "#61afef",
  purple  = "#c678dd",
}

-- Comments
vim.api.nvim_set_hl(0, "@comment",          { fg = colors.comment, italic = false })
vim.api.nvim_set_hl(0, "@comment.todo",     { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, "@comment.error",    { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "@comment.warning",  { fg = colors.orange, bold = true })

-- Variables
vim.api.nvim_set_hl(0, "@variable",             { fg = colors.fg })
vim.api.nvim_set_hl(0, "@variable.builtin",     { fg = colors.red })
vim.api.nvim_set_hl(0, "@variable.parameter",   { fg = colors.fg })
vim.api.nvim_set_hl(0, "@variable.member",      { fg = colors.fg })
vim.api.nvim_set_hl(0, "@field",                { fg = colors.fg })
vim.api.nvim_set_hl(0, "@property",             { fg = colors.fg })

-- Constants
vim.api.nvim_set_hl(0, "@constant",             { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.builtin",     { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.macro",       { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constant.enum",        { fg = colors.cyan })

-- Types & classes
vim.api.nvim_set_hl(0, "@type",                 { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.builtin",         { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.definition",      { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.class",           { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "@type.enum",            { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@namespace",            { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@module",               { fg = colors.yellow })

-- Functions
vim.api.nvim_set_hl(0, "@function",             { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.builtin",     { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.call",        { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.method",      { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.macro",       { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constructor",          { fg = colors.blue })

-- Keywords & control flow
vim.api.nvim_set_hl(0, "@keyword",              { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.function",     { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.operator",     { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.return",       { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.repeat",       { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.conditional",  { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.exception",    { fg = colors.purple })
vim.api.nvim_set_hl(0, "@keyword.type",         { fg = colors.yellow })

-- Preprocessor / include / import
vim.api.nvim_set_hl(0, "@keyword.import",       { fg = colors.blue })
vim.api.nvim_set_hl(0, "@include",              { fg = colors.blue })
vim.api.nvim_set_hl(0, "@preproc",              { fg = colors.blue })

-- Literals
vim.api.nvim_set_hl(0, "@string",               { fg = colors.green })
vim.api.nvim_set_hl(0, "@string.escape",        { fg = colors.purple })
vim.api.nvim_set_hl(0, "@character",            { fg = colors.green })
vim.api.nvim_set_hl(0, "@number",               { fg = colors.orange })
vim.api.nvim_set_hl(0, "@boolean",              { fg = colors.orange })
vim.api.nvim_set_hl(0, "@float",                { fg = colors.orange })

-- Operators & punctuation
vim.api.nvim_set_hl(0, "@operator",             { fg = colors.fg })
vim.api.nvim_set_hl(0, "@punctuation",          { fg = colors.fg })

-- Tags (HTML/JSX)
vim.api.nvim_set_hl(0, "@tag",                  { fg = colors.red })
vim.api.nvim_set_hl(0, "@tag.attribute",        { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@tag.delimiter",        { fg = colors.fg })

-- Annotations / decorators
vim.api.nvim_set_hl(0, "@attribute",            { fg = colors.cyan, italic = true })
vim.api.nvim_set_hl(0, "@decorator",            { fg = colors.cyan, italic = true })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError",       { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn",        { fg = colors.orange })
vim.api.nvim_set_hl(0, "DiagnosticInfo",        { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint",        { fg = colors.cyan })

-- JSON, YAML, TOML
vim.api.nvim_set_hl(0, "@label.json",           { fg = colors.red })
vim.api.nvim_set_hl(0, "@field.yaml",           { fg = colors.red })
vim.api.nvim_set_hl(0, "@property.toml",        { fg = colors.red })

-- Markdown
vim.api.nvim_set_hl(0, "@text.title",           { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "@text.strong",          { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "@text.emphasis",        { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, "@text.uri",             { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, "@text.literal",         { fg = colors.green })
vim.api.nvim_set_hl(0, "@text.quote",           { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "@text.reference",       { fg = colors.cyan })

-- HTML, CSS
vim.api.nvim_set_hl(0, "@tag.html",             { fg = colors.red })
vim.api.nvim_set_hl(0, "@attribute.html",       { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@property.css",         { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@string.css",           { fg = colors.green })
vim.api.nvim_set_hl(0, "@number.css",           { fg = colors.orange })
vim.api.nvim_set_hl(0, "@type.css",             { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@function.css",         { fg = colors.blue })

-- C, C++
vim.api.nvim_set_hl(0, "@module.cpp",           { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@namespace.cpp",        { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.cpp",             { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@keyword.directive.cpp",{ fg = colors.blue })
vim.api.nvim_set_hl(0, "@constant.cpp",         { fg = colors.cyan })

-- Python
vim.api.nvim_set_hl(0, "@variable.builtin.python", { fg = colors.red })
vim.api.nvim_set_hl(0, "@function.builtin.python", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@keyword.import.python",   { fg = colors.blue })
vim.api.nvim_set_hl(0, "@keyword.exception.python",{ fg = colors.purple })

-- JavaScript / TypeScript
vim.api.nvim_set_hl(0, "@property.javascript",   { fg = colors.fg })
vim.api.nvim_set_hl(0, "@variable.javascript",   { fg = colors.fg })
vim.api.nvim_set_hl(0, "@keyword.export",        { fg = colors.blue })
vim.api.nvim_set_hl(0, "@keyword.import",        { fg = colors.blue })
vim.api.nvim_set_hl(0, "@type.tsx",              { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@tag.tsx",               { fg = colors.red })

EOF


" Gán lại màu tím cho các từ khóa
"highlight Keyword guifg=#C586C0
"highlight Function guifg=#C586C0
"highlight Define guifg=#C586C0
highlight Type guifg=#C586C0

"highlight NERDTreeDir guifg=#e5c07b " màu chữ folder
"highlight NERDTreeDirSlash guifg=#e06c75  "màu dấu /
"highlight Directory guifg=#e5c07b  " màu dấu + 

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚', 
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Ignored'   : '☒',
    \ 'Clean'     : '✔︎',
    \ 'Unknown'   : '?',
    \ }

" Đổi ký tự mũi tên
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

"vim.api.nvim_set_hl(0, "@function", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@type", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#C586C0" })
"61afef
"lua << EOF
"vim.api.nvim_set_hl(0, "@keyword.function.python", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@function", { fg = "#DCDCAA" }) 
"vim.api.nvim_set_hl(0, "@keyword", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@string.escape", { fg = "#C586C0" })
"vim.api.nvim_set_hl(0, "@character.special", { fg = "#C586C0" })
"#5c6370
"vim.api.nvim_set_hl(0, "@comment", { fg = "#5c6370", italic = false })
"EOF

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
"nnoremap <C-t> :terminal<CR>
nnoremap <C-t> :terminal powershell -NoExit -Command "Set-Location 'D:\'"<CR>:startinsert<CR>
tnoremap <F2> <C-\><C-n>

" Toggle NerdTree (Thêm mới)
" Function toggle NERDTree dựa trên trạng thái hiện tại
function! ToggleNERDTreeProjectRoot()
    if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        " Nếu NERDTree đang mở → đóng
        NERDTreeClose
    else
        " Nếu chưa mở → mở project root
        NERDTreeFind
    endif
endfunction

" Gán Ctrl+b để toggle
nnoremap <silent> <F3> :call ToggleNERDTreeProjectRoot()<CR>

function! ToggleVsplit()
  " Nếu chỉ có 1 cửa sổ -> mở split bên phải
  if winnr('$') == 1
    vsplit
  else
    " Nếu có nhiều cửa sổ -> đóng cửa sổ hiện tại
    close
  endif
endfunction

" Map F8 để bật/tắt vsplit
nnoremap <F8> :call ToggleVsplit()<CR>


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

" Visual Mode: Tab để thụt vào
vnoremap <Tab> >gv

" Visual Mode: Shift-Tab để thụt ra
vnoremap <S-Tab> <gv


lua << EOF
-- màu custom cho cảnh báo và lỗi
local diag_colors = {
  warning_bg = '#D7BA7D', -- vàng giống VSCode warning
  error_bg   = '#F44747', -- đỏ giống VSCode error
  fg         = '#ffffff',
}

-- nhớ file cuối cùng khi chuyển terminal
local last_file = ''

-- lấy theme onedark
local theme = require("lualine.themes.onedark")

-- lấy màu nền thật sự của editor (Normal bg)
local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
if normal_bg then
  normal_bg = string.format("#%06x", normal_bg)
else
  normal_bg = "#1e222a" -- fallback nếu không có
end

-- ép phần dư (c section) có cùng màu với background editor
for _, mode in pairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
  theme[mode].c = { fg = "#abb2bf", bg = normal_bg }
end

require("lualine").setup {
  options = {
    theme = theme,
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
        color = { fg = "#FFFFFF", bg = nil },
        padding = { left = 0, right = 0 },
      },

      --[[ 
      {
        'diff',
        color = { fg = nil, bg = nil },
        separator = ''
      },
      --]]
    },

    lualine_c = {
      {
        function()
          local buftype = vim.bo.buftype
          local fname = vim.api.nvim_buf_get_name(0)

          if buftype == 'terminal' then
            if last_file ~= '' then
              return vim.fn.fnamemodify(last_file, ':p')
            else
              return '[Terminal]'
            end
          end

          if fname ~= '' then
            last_file = fname
            return vim.fn.fnamemodify(fname, ':p')
          else
            return '[No Name]'
          end
        end,
        color = { fg = '#ffffff', bg = normal_bg },
      }
    },

    lualine_x = {
      {
        'filetype',
        icons_enabled = false,
        color = { fg = "#ffffff", bg = normal_bg },
      },
    },

    lualine_y = {
      { function() return '' end, color = { fg = "#FFFFFF", bg = normal_bg }, padding = { left = 0, right = 0 } },
      {
        function()
          local enc = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
          local ff = vim.bo.ff
          local ff_icon = (ff == 'unix' and '') or (ff == 'dos' and '') or (ff == 'mac' and '') or ''
          return string.format('%s[%s %s]', enc, ff, ff_icon)
        end,
        color = { fg = "#FFFFFF", bg = nil },
        separator = '',
      },
    },

    lualine_z = {
      'progress',

      -- vị trí dòng/cột
      function()
        local current = vim.fn.line('.')
        local total = vim.fn.line('$')
        local col = vim.fn.col('.')
        return string.format('\u{E0A1}: %d/%d \u{E0B3} @ %d', current, total, col)
      end,

      -- warning count
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
        color = { fg = diag_colors.fg, bg = diag_colors.warning_bg },
        separator = { left = '' }
      },

      -- error count
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
        color = { fg = diag_colors.fg, bg = diag_colors.error_bg },
        separator = { left = '' }
      },
    },
  },
  --#3E4452
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 2,
        symbols = {
          modified = ' ●',
          alternate_file = '',
          directory = '',
        },
      },
    },
    lualine_z = {
      function() return "buffers" end,
    },
  },

  extensions = { 'nvim-tree', 'quickfix', 'fugitive' },
}
EOF


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

" Map F5
"nnoremap <silent> <F5> :call ToggleNERDTreeFind()<CR>

" Mở D:/ trong NERDTree (F5)
nnoremap <silent> <F5> :call ToggleNERDTreeWithCD('D:/')<CR>
" Mở C:/ trong NERDTree (F6)
"nnoremap <silent> <F6> :call ToggleNERDTreeWithCD('C:/')<CR>
" Mở D:/Github trong NERDTree (F4)
nnoremap <silent> <F4> :call ToggleNERDTreeWithCD('D:/Github')<CR>

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
hi Floaterm guibg=Gray15
"hi FloatermBorder guifg=#abb2bf guibg=1e1e1e 
hi FloatermBorder guifg=Orange guibg=DarkGreen
"hi FloatermBorder guifg=#000000 guibg=#98c379
"#98c379
" orange  = "#d19a66",
" yellow  = "#e5c07b",
"hi FloatermBorder guifg=Black guibg=#3ECEB3 gui=bold "#d19a66 "#D7BA7D "#3ECEB3 

"autocmd User FloatermOpen

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
hi! fzf_border ctermfg=7

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
map <silent> <F6> :BLines<CR>
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

" Terminal
if has('win32')
  let g:floaterm_shell = 'powershell -nologo'
endif

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

" Tuỳ chọn cấu hình (nếu cần)
let g:lazygit_floating_window_winblend = 0 " Độ trong suốt
let g:lazygit_floating_window_scaling_factor = 0.9 " Tỉ lệ cửa sổ
let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─','╰','│'] " Viền
let g:lazygit_use_neovim_remote = 1 " Sử dụng neovim remote

" Mở Lazygit trong floating terminal
nnoremap <silent> <F10> :FloatermNew! --position=bottomleft --height=0.85 --width=0.59 --title='GitLog' lazygit<CR>
" Trong terminal mode của floaterm gitlog
autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-n>:FloatermKill gitlog<CR>

autocmd TermClose * :call nvim_command('redraw!') | call nvim_command('mode') | call nvim_command('redraw!')
