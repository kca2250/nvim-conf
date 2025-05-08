return {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- アイコン表示用（あってもなくてもOK）
    "MunifTanjim/nui.nvim",        -- UI系だが、このプラグインには不要かも？
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
  },
}

