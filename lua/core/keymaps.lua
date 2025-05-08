-- lua/core/keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ファイルツリー開閉 (Neo-tree)
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- バッファ切り替え
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)

-- LSP 関連
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { silent = true, desc = "Open LazyGit" })

-- window間を移動
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- code_companion 
vim.keymap.set("n", "<leader>cc", function()
  require("codecompanion").chat()
end, { desc = "CodeCompanion Chat" })

vim.keymap.set("n", "<leader>ce", function()
  require("codecompanion").explain()
end, { desc = "Explain Code" })

vim.keymap.set("v", "<leader>cr", function()
  require("codecompanion").refactor()
end, { desc = "Refactor selected code" })

vim.keymap.set("v", "<leader>cf", function()
  require("codecompanion").fix()
end, { desc = "Fix selected code" })

