-- init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
