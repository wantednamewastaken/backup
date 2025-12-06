---- ORDER MATTERS ---
require('ryan.keybinds')
--require('ryan.extra')

require('config.lazy')

--require('ryan.plugins')
--require('ryan.autocmds')
require('ryan.nixd')
require('ryan.ale')
--require('ryan.replacement')
--require('ryan.null_ls')

--require('ryan.test')
-- require('ryan.reload')
---- ORDER MATTERS ---

--- fenc might be pointless, just trying to fix shit"""
vim.o.fenc="utf-8"

-- Preceding dots
vim.opt.list = true
vim.opt.listchars= {
    space = '·',
    --extends = ' ',
    --precedes = ' ',
    tab = '··',
    --trail = ' ',
    eol = '↴',
}
-- set leadmultispace='\u258F'
vim.o.list = true
vim.o.tw = 180


if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end

-- autocmd WinNew * wincmd L
vim.env.BASH_ENV = vim.fn.expand("~/.bash_aliases")

--require'lspconfig'.lua_ls.setup{}

-- Eliminate potential vim issues
vim.g.nocompatible = true
-- Enable type file detection. Vim will be able to try to detect the type of file is use.
vim.cmd("filetype on")
    -- Enable plugins and load plugin for the detected file type.
vim.cmd("filetype plugin on")
    -- Load an indent file for the detected file type.
vim.cmd("filetype indent on")

--vim.o.syntax = true
--vim.o.number = true
--vim.o.confirm = true

--require('lspconfig').pylsp.setup{
--  settings = {
--    pylsp = {
--      plugins = {
--        pylint = {
--          args = {"--max-line-length=140", "--ignore=E501,E266,W503"},
--        }
--      }
--    }
--  }
--}

vim.o.splitbelow = true
vim.o.splitright = true

-- Fold settings
vim.o.foldmethod = "indent"
vim.o.foldignore = ' '
vim.o.foldlevelstart = 5
vim.o.foldminlines = 20

-------
-- vim.lsp.buf.rename() probably useful to setup to change variable names easy

vim.g.powerline_pycmd = "py3"
vim.g.python3_host_prog = '/home/ryan/.pyenv/version'
vim.g.python_highlight_all = 1
-- python3 from powerline.vim import setup as powerline_setup
-- python3 powerline_setup()
-- python3 del powerline_setup

-- print("Setting color...")
vim.cmd([[colorscheme monokai]])
--vim.cmd("colorscheme synthwave84")
--vim.cmd("colorscheme molokai ")
--vim.cmd("colorscheme onedark")
-- vim.cmd [[ colorscheme gruvbox ]]
-- print("SHould be set")
--
---vim.api.nvim_create_user_command('ReloadConfig', function()
---  require('ryan.reloaded')
---  print("Neovim configuration reloaded  !")
---end, {})

vim.cmd [[ packloadall ]]
vim.cmd [[ silent! = helptags ALL ]]

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
-- "               
-- "               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
-- "               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
-- "               ██║   ██║██║██╔████╔██║██████╔╝██║     
-- "               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
-- "                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
-- "                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-- "               
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
-- " Disable compatibility with vi which can cause unexpected issues.
vim.g.nocompatible = true
-- " Highlight cursor line underneath the cursor horizontally.
vim.o.cursorline = true
-- " Highlight cursor line underneath the cursor vertically.
vim.g.nocursorcolumn = true
-- " Set shift width to 4 spaces.
vim.g.shiftwidth = 4
vim.o.shiftwidth = 4
-- " Set tab width to 4 columns.
vim.g.tabstop=2
--vim.o.tabstop=4
-- " Use space characters instead of tabs.
vim.g.expandtab = true
-- " Do not save backup files.
vim.g.nobackup = true
-- " Do not let cursor scroll below or above N number of lines when scrolling.
vim.g.scrolloff=10
-- " Do not wrap lines. Allow long lines to extend as far as the line goes.
vim.wo.wrap = false
-- " While searching though a file incrementally highlight matching characters as you type.
vim.g.incsearch = true
-- " Ignore capital letters during search.
vim.o.ignorecase = true
-- " Override the ignorecase option if searching for capital letters.
-- " This will allow you to search specifically for capital letters.
vim.g.smartcase = true
-- " Show partial command you type in the last line of the screen.
vim.g.showcmd = true
-- " Show the mode you are on the last line.
vim.g.showmode = true
-- " Show matching words during a search.
vim.g.showmatch = true
-- " Use highlighting when doing a search.
vim.g.hlsearch = true
-- " Set the commands to save in history default number is 20.
vim.g.story=1000
-- " Enable auto completion menu after pressing TAB.
vim.g.wildmenu = true
-- " Make wildmenu behave like similar to Bash completion.
vim.g.wildmode="list:longest" 
-- " There are certain files that we would never want to edit with Vim.
-- " Wildmenu will ignore files with these extensions.
vim.opt.wildignore ="*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
-- " set ssop-=options

-- " STATUS LINE ------------------------------------------------------------ {{{
-- " Clear status line when vimrc is reloaded.
--vim.o.statusline= ""
---- " Status line left side.
--vim.o.statusline = vim.opt.statusline:get() .. "%F %M %Y %R"
---- " Use a divider to separate the left side from the right side.
--vim.o.statusline = vim.opt.statusline:get() .. "%="
---- " Status line right side.
--vim.o.statusline = vim.opt.statusline:get() .. " ascii: %b hex: 0x%B row: %l col: %c percent: %p%%"
---- " Show the status on the second to last line.
vim.o.laststatus=2

vim.o.relativenumber = true

-- "python3 from powerline.vim import setup as powerline_setup
-- "python3 powerline_setup()
-- "python3 del powerline_setup
-- """"""""""""""""""""""""""""""""""""""""""""""""
-- "set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
-- "set laststatus=2
-- "set t_Co=256
-- """""""""""""""""""""""""""""""""""""""""""""""'
-- " }}}

-- print(package.loaded[ryan])
--
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

local tokyo_night_colors = {
  background = "#1a1b26",
  current_line = "#232634",
  selection = "#2a2d3e",
  foreground = "#c0caf5",
  comment = "#5c6370",
  red = "#f7768e",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#73daca",
  cyan = "#7dcfff",
  pink = "#bb9af7"
}

--local theme = {
--  normal = {
--    a = { fg = colors.white, bg = colors.black },
--    b = { fg = colors.white, bg = colors.black },
--    c = { fg = colors.white, bg = colors.deepblue },
--    z = { fg = colors.white, bg = colors.black },
--  },
--  --normal = { a = { fg = colors.black, bg = col.lavender} },
--  insert = { a = { fg = colors.black, bg = col.sapphire } },
--  visual = { a = { fg = colors.black, bg = colors.orange } },
--  replace = { a = { fg = colors.black, bg = colors.peach } },
--}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

--require('transparent').clear_prefix('lualine')

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
	--print(name)
	----- ALMOST CERTAIN NONE OF THIS IS WORKING
	--if name == 'lualine_x' then
	--  table.insert(section, pos * 2, { empty, color = { fg = nil, bg = nil } })
	table.insert(section, pos * 1, { empty, color = { fg = col.sapphire, bg = colrs.grey } })
	--else
	--  table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = col.sapphire } })
	--end
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      --comp.separator = left and { right = '' } or { left = '' }
      comp.separator = left and { right = '🮥' } or { left = '🮤' }
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

local darker_grey = "#707070"

local theme = {
  normal = {
    a = { fg = colors.black, bg = col.blue },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = darker_grey },
    z = { fg = colors.black, bg = col.blue },
  },
  --normal = { a = { fg = colors.black, bg = col.lavender} },
  insert = { a = { fg = colors.black, bg = tokyo_night_colors.pink } }, --z = { bg = col.sapphire }},
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.peach } },
}

require('lualine').setup {
  options = {
    theme = theme,
    --theme = {
    --    normal = {
    --        --- Make slightly less dark
    --        a = { fg = colors.black, bg = col.sapphire},
    --        b = { fg = colors.black, bg = col.sky },
    --        c = { fg = colors.black },
    --        --d = { fg = colors.black, bg = col.teal },
    --    },
    --},
----    component_separators = '',
----    --section_separators = { left = '', right = '' },
   --section_separators = { left = '🮥', right = '🮤' },
  },
--  sections = {   --process_sections {
--    --lualine_transitional_lualine_b_diagnostics_hint_command_to_lualine_c_normal = {
--    --    {color = { bg = nil, fg = '#444555' }}
--    --},
----   lualine_a = { 'mode' },
--   --lualine_c = {
--   --    { 'normal', color = { bg = nil, fg = '#ffffff' } },
--   --    { 'filename', 'dd' , color = { bg = nil, fg = '#dddddd' } },
--   --    --{ 'utf-8', color = { bg = nil, fg = '#ffffff' } },
--   --},
--   --lualine_c_filename = {
--   --    {string.format('%s %s', 'My Text', '%f'), color = { bg = col.blue, fg = '#ffffff' }}, -- or any other string format
--   -- },
--   --lualine_c_normal = {
--   --    {string.format('%s %s', 'My Text', '%f'), color = { bg = col.blue, fg = '#ffffff' }}, -- or any other string format
--   -- },
--   --lualine_z = {
--   --    { 'normal', color = { bg = col.blue, fg = '#ffffff' } },
--   --    { 'normal', color = { bg = col.blue, fg = '#ffffff' } },
--   --},
--   --lualine_d = {
--   --    { 'filename', color = { bg = col.sapphire, fg = '#ffffff' } },
--   --    --{ 'filename', color = { bg = nil, fg = '#030303' } },
--   --    --{ 'utf-8', color = { bg = nil, fg = '#ffffff' } },
--   --},
--},
--   lualine_b = {
--     'branch',
--     'diff',
--     {
--       'diagnostics',
--       source = { 'nvim' },
--       sections = { 'error' },
--       diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
--     },
--     {
--       'diagnostics',
--       source = { 'nvim' },
--       sections = { 'warn' },
--       diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--     },
--     { 'filename', file_status = false, path = 1 },
--     { modified, color = { bg = colors.red } },
--     {
--       '%w',
--       cond = function()
--         return vim.wo.previewwindow
--       end,
--     },
--     {
--       '%r',
--       cond = function()
--         return vim.bo.readonly
--       end,
--     },
--     {
--       '%q',
--       cond = function()
--         return vim.bo.buftype == 'quickfix'
--       end,
--     },
--   },
   --lualine_c = {},
--   lualine_x = {},
--   lualine_y = { search_result, 'filetype' },
--   lualine_z = { '%l:%c', '%p%%/%L' },
-- },
-- inactive_sections = {
--   lualine_c = { '%f %y %m' },
--   lualine_x = {},
-- },
}
--vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.transparent },
  },

  insert = { a = { fg = colors.white, bg = colors.blue } },
  visual = { a = { fg = colors.white, bg = colors.cyan } },
  replace = { a = { fg = colors.white, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.transparent },
    b = { fg = colors.white, bg = colors.transparent },
    c = { fg = colors.black, bg = colors.transparent },
  },
}

--require('lualine').setup {
--  options = {
--    theme = bubbles_theme,
--    component_separators = '|',
--    section_separators = { left = '', right = '' },
--  },
--  sections = {
--    lualine_a = {
--      { 'mode', separator = { left = '' }, right_padding = 2 },
--    },
--    lualine_b = { 'filename', 'branch' },
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = { 'filetype' }, --  "vim.fn.expand('%:h')" 
--    lualine_z = {
--      { 'location', separator = { right = '' }, left_padding = 2 },
--    },
--  },
--  inactive_sections = {
--    lualine_a = { 'filename' },
--    lualine_b = {},
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = {},
--    lualine_z = { 'location' },
--  },
--  tabline = {},
--  extensions = {},
--}

--require('telescope.builtin').quickfix()
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--ignore', '**/__pycache__/*',
      '--ignore', '**/__pycache__/',
      -- other args
    },

    file_ignore_patterns = {
      "%.pyc",
      "%.__pycache__/", -- ignore pycache directories
      "%.__init__.py", -- ignore pycache directories
      "%.git/",       -- ignore .git directory
      "git_bak",       -- ignore .git directory
      "%.hg/",        -- ignore .hg directory
      "%.svn/",       -- ignore .svn directory
      "%.cache/",     -- ignore cache directories
      "%.png",        -- ignore png files
      "%.jpg",        -- ignore jpg files
    },

    mappings = {
      -- Insert mode mappings
      i = {
        ["<C-h>"] = "move_selection_previous",
        ["<C-l>"] = "move_selection_next",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
	["<Esc>"] = require('telescope.actions').close,
        -- You can map hjkl too if you prefer
     --   ["h"] = "move_selection_previous",
     --   ["l"] = "move_selection_next",
     --   ["j"] = "move_selection_next",
     --   ["k"] = "move_selection_previous",
     -- },
     -- -- Normal mode mappings (if you use them)
     n = {
	["<Esc>"] = require('telescope.actions').close,
     --   ["h"] = "move_selection_previous",
     --   ["l"] = "move_selection_next",
     --   ["j"] = "move_selection_next",
     --   ["k"] = "move_selection_previous",
	},
      },
    },
  },
}
--END
