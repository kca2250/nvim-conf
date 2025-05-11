-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function set_transparent_highlights()
      vim.api.nvim_set_hl(0, "NeoTreeNormal",        { bg = "none", bold = true})
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC",      { bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeFloatBorder",   { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeFloatNormal",   { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#ffffff"})
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#c0c7dc"})
      vim.api.nvim_set_hl(0, "NeoTreeFileName",      { fg = "#cdd6f4" }) -- 通常ファイル
      vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened",{ fg = "#89dceb", bold = true }) -- 開いているファイル
      vim.api.nvim_set_hl(0, "NeoTreeModified",      { fg = "#fab387" }) -- 未保存ファイル（●マーク）
      vim.api.nvim_set_hl(0, "NeoTreeMessage",       { fg = "#f38ba8" }) -- 新規ファイルなどのメッセージ表示
    end

    require("neo-tree").setup {
      sources = { "filesystem", "buffers", "git_status" },

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignore = false,
          hide_by_name = { ".DS_Store" },
          hide_by_pattern = {},
          always_show = vim.tbl_map(function(name)
            return ".env." .. name
          end, { "local", "development", "production", "test" }),
          never_show = {},
          never_show_by_pattern = {},
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      },

      buffers = {
        follow_current_file = true,
        group_empty_dirs = true,
      },

      window = {
        position = "left",
        width = 35,
        source_selector = {
          winbar = false,   -- タブ切り替え表示しない（必要なら true にしてね）
          statusline = false,
        },
      },

      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "󰈚", -- 通常ファイルのアイコン
        },
        modified = {
          symbol = "\u{f071}", -- 未保存ファイルにつくマーク
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "m",
            deleted   = "d",
            renamed   = "➜",
            untracked = "_",
            ignored   = "◌",
            unstaged  = "_",
            staged    = "✓",
            conflict  = "",
          },
        },
      },
    }

    -- ハイライト透過を起動時＆カラースキーム変更時に適用
    set_transparent_highlights()
      vim.api.nvim_create_augroup("MyTransparent", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = "MyTransparent",
        callback = set_transparent_highlights,
      })

    -- キーマップ
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    map("n", "<leader>e", "<cmd>Neotree reveal<CR>", { desc = "ファイルツリーを開く", unpack(opts) })
    map("n", "<leader>n", "<cmd>Neotree filesystem toggle<CR>", { desc = "NeoTreeをトグル", unpack(opts) })
    map("n", "<leader>nf", "<cmd>Neotree focus<CR>", { desc = "NeoTreeにフォーカス", unpack(opts) })
    map("n", "<leader>ob", "<cmd>Neotree buffers toggle<CR>", { desc = "開いてるバッファ一覧", unpack(opts) })
    map("n", "<leader>og", "<cmd>Neotree git_status toggle<CR>", { desc = "Gitステータス一覧", unpack(opts) })
  end,
}

