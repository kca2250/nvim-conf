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
        custom = { ".ds_store" },
      },
      view = {
        width = 38,

        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * 0.5
            local window_h = screen_h * 0.4
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                             - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
            end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * 0.5)
        end,
      },
      update_focused_file = {
        enable = true,
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

