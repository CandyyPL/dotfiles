-- NeoVim config

local o = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- status line
o.laststatus = 2
o.showmode = false

-- line numeration
o.number = true
o.relativenumber = true
o.cursorline = true
o.numberwidth = 6

o.number = true
o.cursorline = true
o.numberwidth = 6
o.number = true
o.cursorline = true
o.numberwidth = 6

-- mouse support
o.mouse = 'a'

-- searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

-- word wrap
o.wrap = true
o.breakindent = true

-- indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true

-- swap file disable
o.swapfile = false

-- colors
o.termguicolors = true

-- mappings
local function map(m, k, c)
  vim.keymap.set(m, k, c, { silent = true})
end

vim.g.mapleader = ' '

-- lazy
map('n', 'lz', ':Lazy home<CR>')

-- save / exit
map('n', 'ss', ':w<CR>')
map('n', 'sa', ':wa<CR>')
map('n', 'zz', ':q<CR>')
map('n', 'za', ':qa<CR>')

-- nvimtree
map('n', 'bb', ':NvimTreeToggle<CR>')
map('n', 'bf', ':NvimTreeFocus<CR>')

-- telescope
map('n', 'ff', ':Telescope find_files<CR>')

-- bufferline
map('n', 'tx', ':bd<CR>') 
map('n', '<PageDown>', ':BufferLineCycleNext<CR>')
map('n', '<PageUp>', ':BufferLineCyclePrev<CR>')

-- others
map('n', 'nh', ':nohl<CR>')

-- plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme onedark]])
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-tree/nvim-tree.lua',
  },
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          filetypes = { 'html', 'php', 'javascript', 'javascriptreact', 'jsx' },
        },
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'styled-components/vim-styled-components',
  },
}

local opts = {}

require('lazy').setup(plugins, opts)

-- plugins config

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- bufferline
local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = 'buffers',
    style_preset = bufferline.style_preset.no_italic,
    themable = true,
    numbers = 'ordinal',
    indicator = {
      style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    color_icons = true,
    separator_style = "slant",
    hover = {
      enables = true,
      delay = 100,
      reveal = {'close'}
    },
  }
}

-- nvimtree
local nvimtree = require('nvim-tree')
nvimtree.setup {
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

-- onedark
local onedark = require('onedark')
onedark.setup {
  style = 'darker',
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
}

onedark.load()

