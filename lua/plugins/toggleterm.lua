-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size          = 20,
      open_mapping  = false,    -- デフォルトキーは無効化
      hide_numbers  = true,
      shade_filetypes = {},
      direction     = "float",
      float_opts    = {
        border = "rounded",
        width  = math.floor(vim.o.columns * 0.8),
       height = math.floor(vim.o.lines * 0.8),
      },
      persist_size  = true,
      close_on_exit = true,
    })

        -- keymaps
    local map = vim.keymap.set
    -- 1番目（普通に起動）
    map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", {
      noremap = true,
      silent = true,
      desc = "ToggleTerm #1",
    })
    -- 2番目（新しいタブ的に使いたいとき）
    map("n", "<A-\\>", "<cmd>ToggleTerm 2<CR>", {
      noremap = true,
      silent = true,
      desc = "ToggleTerm #2",
    })
    -- 3番目以降も必要なら
    map("n", "<leader>t3", "<cmd>ToggleTerm 3<CR>", {
      noremap = true,
      silent = true,
      desc = "ToggleTerm #3",
    })

  end,
}

