-- lua/core/options.lua
local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.relativenumber = false
o.expandtab = true
o.shiftwidth = 2
o.clipboard = "unnamedplus"
o.wrap = false

-- Treesitter の型を italic にする
vim.api.nvim_set_hl(0, "@type", { fg = "#b0b0ff", italic = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#9999dd", italic = true })
vim.api.nvim_set_hl(0, "@property", {
  underline = true,
  fg = "#ffcc66", -- 黄色っぽく
})

