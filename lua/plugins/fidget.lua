return {
  "j-hui/fidget.nvim",
  version = "*", -- v1系の最新版を使う
  event = "VeryLazy",
  config = function()
    require("fidget").setup({})
  end,
}

