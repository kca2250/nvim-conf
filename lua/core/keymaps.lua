-- lua/core/keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- toggleterm
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tc", "<cmd>ToggleTermToggleAll<CR>", { desc = "すべてのターミナルを非表示にする" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- LSP 関連
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setqflist()
end, { desc = "LSPエラー一覧をQuickfixに表示" })

-- window間を移動
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)

-- 横分割の高さ調整（上下）
vim.keymap.set("n", "<C-w>", ":resize +2<CR>")
vim.keymap.set("n", "<C-s>", ":resize -2<CR>")

-- 縦分割の幅調整（左右）
vim.keymap.set("n", "<C-a>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-d>", ":vertical resize +2<CR>")

-- 行移動
-- Normalモードで行を上下に移動
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visualモードで選択した行を上下に移動
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Vjj>>>>を連続で入力できるようにする
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Outdent and keep selection" })

-- カーソル移動強化
map("n", "H", "^", opts) -- 行頭（インデント後）へ
map("n", "L", "g_", opts) -- 行末（末尾文字）へ
map("n", "J", "5j", opts) -- 5行下へ（高速移動）
map("n", "K", "5k", opts) -- 5行上へ

-- スクロールとセンタリング
map("n", "<C-u>", "<C-u>zz", opts) -- 半ページ上＋中央表示
map("n", "n", "nzzzv", opts)       -- 検索移動後に中央表示
map("n", "N", "Nzzzv", opts)

-- Escを押したら検索ハイライトをクリア
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "ハイライトを消す", silent = true })

vim.keymap.set("n", "<leader>*", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", word)
  vim.cmd("normal! n")  -- 最初のマッチにジャンプ
end, { desc = "現在の単語を検索＆ハイライト" })

-- CodeCompanion display loading
vim.keymap.set("n", "<leader>cc", function()
  require("core.codecompanion_ui").send_chat_with_progress()
end, { desc = "CodeCompanion Chat + Thinking 表示" })

-- CodeCompanion inline assistant
vim.keymap.set("v", "<leader>ci", function()
  vim.ui.input({ prompt = "修正したい内容を入力してください：" }, function(input)
    if input and input ~= "" then
      vim.cmd("'<,'>CodeCompanion " .. input)
    end
  end)
end, { desc = "CodeCompanion: インラインアシスタント" })
