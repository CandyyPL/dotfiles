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
o.mouse = "a"

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

-- plugins
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-lualine/lualine.nvim")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("luukvbaal/statuscol.nvim")

vim.call("plug#end")

-- plugins config

-- lualine
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "", right = " " },
		section_separators = { left = "", right = "" },
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
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "directory", "filename" },
		lualine_x = { "diff" },
		lualine_y = { "progress", },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("statuscol").setup({
	relculright = true,
})

require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-mocha")
