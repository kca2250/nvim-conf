-- lua/plugins/dressing.lua
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      relative = "editor", -- "cursor" にするとカーソル周辺に出る
      win_options = {
        winblend = 0,
      },
    },
    select = {
      enabled = true,
    },
  },
}

