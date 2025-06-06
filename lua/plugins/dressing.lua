-- lua/plugins/dressing.lua
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      relative = "cursor", -- "cursor" にするとカーソル周辺に出る
      border = "rounded", -- "rounded" にすると角が丸くなる
      win_options = {
        winblend = 0,
      },
    },
    select = {
      enabled = true,
    },
  },
}

