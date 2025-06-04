-- init.lua
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- core
require("core.options")
require("core.keymaps")
require("core.env")
require("core.commands")
-- plugins
require("plugins")
