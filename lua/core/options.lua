-- lua/core/options.lua
local o = vim.opt
local g = vim.g
local a = vim.api
local a_set_hl = a.nvim_set_hl

-- Prettierの状態をlualineで使うための初期化
g.prettier_status = ""

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.relativenumber = false
o.expandtab = true
o.shiftwidth = 2
o.clipboard = "unnamedplus"

o.termguicolors = true
o.cursorline = true
o.hlsearch = true       -- 検索語をハイライト
o.incsearch = true      -- インクリメンタルサーチ（入力しながらマッチ）


-- vim.api.nvim_set_option_value("winhighlight", "Normal:Normal,NormalNC:Normal", { scope = "local" })
 
-- ハイライトの設定
a_set_hl(0, "ActiveWinSeparator", { fg = "#ff5f87", bold = true }) -- ピンク系
a_set_hl(0, "InactiveWinSeparator", { fg = "#5c5c5c" })            -- グレー系
 
  
-- Treesittear の型を italic にする
a_set_hl(0, "@type", { fg = "#b0b0ff", italic = true })
a_set_hl(0, "@type.builtin", { fg = "#9999dd", italic = true })
  

