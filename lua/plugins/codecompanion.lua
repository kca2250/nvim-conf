-- lua/plugins/codecompanion.lua
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ravitemer/codecompanion-history.nvim",
    {
      "ravitemer/mcphub.nvim",
      config = true,
    },
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionDiff", "CodeCompanionHistory" },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat<CR>", desc = "CodeCompanion Chat 開く" },
    { "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "AIアクション一覧" },
    { "<leader>cd", "<cmd>CodeCompanionDiff<CR>", desc = "AI提案のDiffを見る" },
  },

  extensions = {
    histrory = {
      enabled = true,
      opts = {
       auto_save = true,
        picker = "telescope",
        auto_generate_title = true,
      },
    },
  },
  opts = {
    language = 'ja',
    ai_model = "gpt-4o",

    system_prompt = function(opts)
      return table.concat({
        "あなたはNeovimの中で動作するAIプログラミングアシスタントです。",
        "すべての質問には日本語で、簡潔かつ正確に回答してください。",
        "コードには日本語での説明コメントをつけてください。",
        "Markdown形式を使用し、コードブロックには言語指定を含めてください（例：```lua）。",
        "返答は丁寧語でお願いします。",
      }, "\n")
    end,


    strategies = {
      chat = {
        adapter = "openai",
        model = "gpt-4o",
      },
      inline = {
        adapter = "openai",
        model = "gpt-4o",
      },
    },

    adapters = {
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = os.getenv("OPENAI_API_KEY"),
          },
        })
      end,
    },

    display = {
      chat = {
        intro_message = "CodeCompanion へようこそ！✨",
        show_token_count = false,
        auto_scroll = true,
        show_header_separator = false, -- markdown強化時は false 推奨

        window = {
          layout = "float",
          border = "rounded",
          width = 0.5,
          height = 0.7,
          center = {
            row = 0.5,
            col = 0.5,
          },
          top = {
            row = 0.0,
            col = 0.5,
          },
          bottom = {
            row = 1.0,
            col = 0.5,
          },
          left = {
            row = 0.5,
            col = 0.0,
          },
          right = {
            row = 0.5,
            col = 1.0,
          },
        }

      }
    },

    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        }
      }
    },
  },
}

