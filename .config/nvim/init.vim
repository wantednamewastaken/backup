"source $VIMRUNTIME/defaults.vim
""" fenc might be pointless, just trying to fix shit"""
set fenc=utf-8

if exists('g:vscode')
    "
else
    "Preceding dots
    set listchars=space:·,tab:··
    "set listchars=space:·,tab:*, leadmultispace:d , " eol:↴▏
    "set leadmultispace='\u258F'
    set list
    set tw=180

    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

    au BufNewFile,BufRead *.rs
            \ syntax enable
            \ | filetype plugin indent on
            \ | set omnifunc=ale#completion#OmniFunc
            \ | let g:ale_completion_enabled = 1
            \ | let g:ale_completion_autoimport = 1

    au BufNewFile *.txt
            \ colorscheme molokai 
            \ | set textwidth=120

    au BufNewFile,BufRead *.py
                \ set tabstop=4
                \ | set softtabstop=4
                \ | set shiftwidth=4
                \ | set textwidth=140
                \ | set expandtab
                \ | set autoindent
                \ | set fileformat=unix
                "\ | colorscheme gruvbox
endif


if (has("termguicolors"))
    set termguicolors
endif

"autocmd WinNew * wincmd L
let $BASH_ENV = "~/.bash_aliases"

call plug#begin('~/.vim/plugged')
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
"Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
"Plug 'Exafunction/codeium.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-python/python-syntax'
Plug 'artanikin/vim-synthwave84'
Plug 'rust-lang/rust.vim'
"Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'powerline/powerline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xiyaowong/transparent.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'sharkdp/fd'
    Plug 'BurntSushi/ripgrep'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()


"Eliminate potential vim issues
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
syntax on
set number
set confirm

" Move to the next buffer
nmap <tab> :bnext<CR>
" Move to the previous buffer
nmap <s-tab> :bprev<CR>

set splitbelow
set splitright

" Fold settings
set foldmethod=indent
set foldignore=
set foldlevelstart=1
set foldminlines=20
nnoremap <C-f> :Files! <cr>
nnoremap <C-g> :GFiles! <cr>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"inoremap <silent><expr><TAB>
"            \ pumvisible() ? \"\<C-n" : \"\<TAB>"
"set instead of let?
"let mapleader='\'
let mapleader=';'
"let maplocalleader=something
"Also available is 'resize' (res), 'vertical resize'
nnoremap <Leader><left> :50winc <<cr>
nnoremap <Leader><right> :50winc ><cr>
nnoremap <Leader><up> :5winc -<cr>
nnoremap <Leader><down> :5winc +<cr>
nnoremap <C-A-h> <C-w>h
nnoremap <C-A-j> <C-w>j
nnoremap <C-A-k> <C-w>k
nnoremap <C-A-l> <C-w>l
nnoremap <Leader><,> <C-w><
nmap <F2> :ALEGoToDefinition<cr>
nmap <F3> :ALEFindReferences<cr>
nmap T :terminal<cr>
nmap - :NERDTreeToggle<cr>
nmap <F5> :noh<cr>
"nmap w :w
nmap Q :q<cr>
"imap jj <Esc>
imap jj <Esc>:ALEFix<cr>
map <Leader>t :TransparentToggle<cr>
"nmap F :Files 
" set NERDTree remap

nnoremap <leader>so :source $MYVIMRC<CR>
"nnoremap <Leader>r :! \&filetype %:S<cr>
nnoremap <Leader>r :execute '! ' . &filetype . ' ' . expand('%:S')<CR>
"nnoremap <Leader>r :execute 'w | !' . &filetype . ' ' . expand('%:S')<CR>
"""BUFFERS"""
"nnoremap <Leader><f> :lua require("harpoon.mark").add_file()<cr>
map <Leader>h :lua require("harpoon.ui").toggle_quick_menu()<cr>
map <Leader>m :lua require("harpoon.mark").add_file()<cr>
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>c :close<cr>
map <leader>s :vsplit<cr>
"""Quickfix"""
map <leader>q :copen<cr>
map <leader>v :cnext<cr>
map <leader>x :cprev<cr>
map <leader>v :vim
"""
"vim.lsp.buf.rename() probably useful to setup to change variable names easy

let g:powerline_pycmd="py3"
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

let g:python_highlight_all = 1
let g:ale_set_highlights = 1

let g:ale_completion_enabled = 1
"let g:ale_python_flake8_config_file = '~/.config/flake8'
""" This is working "
" Rest of pycodestyle config seems to work in ~/.config/pycodestyle
let g:ale_python_flake8_options = '--max-line-length=140 --ignore=E501,E266'
"
let g:ale_linters = {
\   'python': ['flake8','pyright','pylsp'],
\   'rust': ['analyzer', 'cargo', 'rls', 'rustc'],
\}
" 'pylint'
let g:ale_rust_rls_toolchain = 'stable'

let g:ale_fixers = {
\   'python': ['black','isort'],
\}

"call ale#Set('python_flake8_options', '--config=$HOME/.config/flake8')
""" IMPORTANT"""" 
" Storing buffer b:ale_fixer in /home/ryan/.vim/ftplugin/python.vim 
" Not true anymore, but still good to know if having plugin 'interference'
"""

let g:ale_fix_on_save = 1

colorscheme monokai 
"colorscheme synthwave84
"colorscheme molokai 
"colorscheme onedark
"colorscheme gruvbox

packloadall
silent! helptags ALL

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set nocursorcolumn
" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4
" Use space characters instead of tabs.
set expandtab
" Do not save backup files.
set nobackup
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" set ssop-=options

" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2

set relativenumber

"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
""""""""""""""""""""""""""""""""""""""""""""""""
"set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256
"""""""""""""""""""""""""""""""""""""""""""""""'
" }}}


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 77bbe3f011055b3d1e91001219cbc423 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/ryan/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line


lua << END
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  deepblue = '#080b31',
}

local col = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    --c = { fg = colors.black, bg = colors.deepblue },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = col.sapphire } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.peach } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.grey } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
END
