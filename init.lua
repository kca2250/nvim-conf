-- init.lua
-- ~/.config/nvim/init.lua の最初に追加
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- windows settings
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "/usr/local/bin/win32yank.exe -i --crlf",
    ["*"] = "/usr/local/bin/win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "/usr/local/bin/win32yank.exe -o --lf",
    ["*"] = "/usr/local/bin/win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}


-- core
require("core.options")
require("core.keymaps")
require("core.env")
require("core.commands")

-- plugins
require("plugins")
