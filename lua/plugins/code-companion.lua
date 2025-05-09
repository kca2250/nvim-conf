return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim", -- 処理中の表示
  },
  config = function()
    local adapters = require("codecompanion.adapters")

    -- gpt-3.5-turbo 用のアダプター
    local gpt35 = adapters.extend("openai", {
      name = "gpt-3.5",
      env = {
        api_key = function()
          return os.getenv("OPENAI_API_KEY")
        end,
      },
      schema = {
        model = {
          default = "gpt-3.5-turbo",
        },
      },
    })

    -- gpt-4 または gpt-4o 用のアダプター
    local gpt4 = adapters.extend("openai", {
      name = "gpt-4",
      env = {
        api_key = function()
          return os.getenv("OPENAI_API_KEY")
        end,
      },
      schema = {
        model = {
          default = "gpt-4o", -- gpt-4 でもOK！
        },
      },
    })

    require("codecompanion").setup({
      log_level = "INFO",
      adapters = {
        gpt_3_5 = function() return gpt35 end,
        gpt_4 = function() return gpt4 end,
      },
      strategies = {
        inline = {
          adapter = "gpt_3_5", -- 編集系は軽いモデル
        },
        chat = {
          adapter = "gpt_4", -- チャット・推論は高性能モデル
        },
      },
      opts = {
        language = "Japanese",
      },
    })

    -- キーマップ
    local map = vim.keymap.set
    map({ "n", "v", "x" }, "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion アクション" })
    map({ "n", "v", "x" }, "<leader>ac", "<cmd>CodeCompanionChat<CR>", { desc = "CodeCompanion チャット" })
    map({ "n", "v", "x" }, "<leader>ae", "<cmd>CodeCompanionCmd<CR>", { desc = "自然言語コマンド" })
    map({ "n", "v", "i" }, "<leader>ay", "<cmd>CodeCompanionAccept<CR>", { desc = "AI変更を受け入れ" })
    map({ "n", "v", "i" }, "<leader>an", "<cmd>CodeCompanionReject<CR>", { desc = "AI変更を却下" })

    -- fidget 表示を有効に（入れている場合）
    require("fidget").setup()
  end,
}

