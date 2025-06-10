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
        custom = { ".DS_Store" },
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
        highlight_modified = "all",
        highlight_git = true,
        icons = {
          show = {
            modified = false,
          },
          glyphs = {
            git = {
              unstaged  = "󰗐",
              staged    = "󰧞",
              renamed   = "➜",
              untracked = "󱗽",
              ignored   = "_",
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtreeトグル" })
  end
}

