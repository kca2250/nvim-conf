return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    -- which-key の表示を即時にする設定
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- デフォルト設定で OK
  },
  keys = {
    -- 任意で手動表示用キーも登録可能
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "WhichKey: show local keymaps",
    },
  },
}
