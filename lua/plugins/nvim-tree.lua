-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("nvim-tree").setup({
      hijack_cursor = true,
      filters = {
        dotfiles = false,
        custom = { ".Ds_store" },
      },
      view = {
        width = function()
          return math.floor(vim.opt.columns:get() * 0.22)
        end,
      },
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      renderer = {
        group_empty = true,
        highlight_modified = "all", -- ← これを追加！
        icons = {
          show = {
            modified = true, -- ← これを追加！
          },
          glyphs = {
            modified = "●", -- ← これを追加！
            git = {
              unstaged  = "✗",
              staged    = "✓",
              renamed   = "➜",
              untracked = "★",
              ignored   = "◌",
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtreeトグル" })
  end
}

