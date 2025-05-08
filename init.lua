-- init.lua
--
-- add path
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- core
require("core.options")
require("core.keymaps")

-- plugins
require("plugins")
