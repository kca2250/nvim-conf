-- init.lua
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- GUI fonts
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

-- core
require("core.options")
require("core.keymaps")
require("core.env")

-- plugins
require("plugins")

