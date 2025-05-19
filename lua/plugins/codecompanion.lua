-- lua/plugins/codecompanion.lua
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
      "ravitemer/mcphub.nvim",
      config = true,
    },
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionDiff" },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat<CR>", desc = "CodeCompanion Chat 開く" },
    { "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "AIアクション一覧" },
    { "<leader>cd", "<cmd>CodeCompanionDiff<CR>", desc = "AI提案のDiffを見る" },
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
      },
      inline = {
        adapter = "openai",
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
        show_token_count = true,
        auto_scroll = true,
        show_header_separator = false, -- markdown強化時は false 推奨

        window = {
          layout = "float",
          position = "right", -- floatでは使われないが保険でOK
          border = "rounded",
          width = 0.7,
          height = 0.4,
          row = 0.1,
          col = 0.5,
          relative = "edior",
        },
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

