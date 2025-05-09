-- lua/plugins/octo.lua
return {
  "pwntester/octo.nvim",
  cmd = { "Octo" }, -- コマンド実行時に読み込む
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons", -- アイコン用（NeoTreeで既に入ってるかも）
  },
  config = function()
    require("octo").setup({
      enable_builtin = true,
      use_local_fs = true, -- ファイルをローカルで見れるように
    })
  end,
}

