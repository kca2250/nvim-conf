-- lua/core/options.lua
local o = vim.opt
local g = vim.g

-- Prettierの状態をlualineで使うための初期化
vim.g.prettier_status = ""

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.relativenumber = false
o.expandtab = true
o.shiftwidth = 2
o.clipboard = "unnamedplus"
o.wrap = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.hlsearch = true       -- 検索語をハイライト
vim.opt.incsearch = true      -- インクリメンタルサーチ（入力しながらマッチ）


-- vim.api.nvim_set_option_value("winhighlight", "Normal:Normal,NormalNC:Normal", { scope = "local" })

-- ハイライトの設定
vim.api.nvim_set_hl(0, "ActiveWinSeparator", { fg = "#ff5f87", bold = true }) -- ピンク系
vim.api.nvim_set_hl(0, "InactiveWinSeparator", { fg = "#5c5c5c" })            -- グレー系


-- Treesitter の型を italic にする
vim.api.nvim_set_hl(0, "@type", { fg = "#b0b0ff", italic = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#9999dd", italic = true })
vim.api.nvim_set_hl(0, "@property", {
  underline = true,
  fg = "#ffcc66", -- 黄色っぽく
})


