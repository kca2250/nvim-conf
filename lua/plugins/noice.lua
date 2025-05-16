return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- LSP設定
      lsp = {
        progress = { enabled = true },
        signature = { enabled = true },
        hover = { enabled = true },
        message = { enabled = true },

        -- 🔽 ここが重要：cmpドキュメントをNoiceで表示！
        override = {
          ["cmp.entry.get_documentation"] = true,
        },

        documentation = {
          view = "hover", -- hoverと同じ見た目で統一
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = {
              concealcursor = "n",
              conceallevel = 3,
              wrap = true,
            },
          },
        },
      },

      -- メッセージ系UI設定
      messages = {
        enabled = true,
        view_search = "virtualtext",
      },

      -- コマンドラインUI設定
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- or "cmdline"
      },

      views = {
        cmdline_popup = {
          position = {
            row = "40%", -- 画面の下
            col = "50%",  -- 水平中央
          },
          border = {
            style = "rounded",
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "FloatBorder",
            },
          },
        },
      },

      -- 補完ポップアップUI
      popupmenu = {
        enabled = true,
      },

      -- プリセット（おすすめUI）
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true, -- LSP hoverとsignatureに枠を追加
      },
    })

    -- 通知の表示を noice + notify に統一
    vim.notify = require("notify")
  end,
}

