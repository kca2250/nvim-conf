-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          -- フィルター自体を可視化
          visible = true,

          -- ドットファイル非表示OFF
          hide_dotfiles = false,

          -- .gitignore に従うフィルターはお好みで
          hide_gitignore = false,

          -- 名前で隠す（今回は空のまま）
          hide_by_name = {
            ".DS_Store"
          },


          -- パターンで隠す（今回は不要）
          hide_by_pattern = {},

          -- **必ず表示** したいファイル名をリスト化
          always_show = {
            ".env", 
            ".env.local",
            ".env.development",
            ".env.production",
          },

          -- 絶対に隠したいなら never_show / never_show_by_pattern も使えます
          never_show = {},
          never_show_by_pattern = {},
        },

        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
      },
      window = {
        position = "left",
        width = 35,
      },
    }

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal<CR>", {
      silent = true,
      desc   = "Reveal NeoTree",
    })
  end,
}
