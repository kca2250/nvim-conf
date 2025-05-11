return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- または { "github/copilot.vim" }
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Mac/Linux 限定
    opts = {
      -- 使用するモデル（OpenAI API 利用時のみ有効）

      model = "gpt-4",
      agent = "copilot",
      prompts = {
        Explain   = "このコードの目的を日本語で簡単に説明してください。",
        Refactor  = "このコードをより読みやすく、保守性の高い形にリファクタリングしてください。",
        Translate = "コメントを日本語に翻訳してください。",
        Review    = "このコードの問題点や改善点を指摘してください。",
        Docstring = "この関数にdocstringを追加してください（日本語）。",
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- 🔁 通常チャット起動
      vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "CopilotChat: Chat with buffer" })
      vim.keymap.set("v", "<leader>cc", ":CopilotChatVisual<CR>", { desc = "CopilotChat: Chat with selection" })

      -- 🎯 カスタムプロンプト起動（Visual モード）
      vim.keymap.set("v", "<leader>cr", ":CopilotChatRefactor<CR>", { desc = "CopilotChat: Refactor", silent = true, noremap = true })
      vim.keymap.set("v", "<leader>E", ":CopilotChatExplain<CR>", { desc = "CopilotChat: Explain", silent = true, noremap = true})
      vim.keymap.set("v", "<leader>ct", ":CopilotChatTranslate<CR>", { desc = "CopilotChat: Translate", silent = true, noremap = true })
      vim.keymap.set("v", "<leader>cd", ":CopilotChatDocstring<CR>", { desc = "CopilotChat: Add docstring", silent = true })
      vim.keymap.set("v", "<leader>cv", ":CopilotChatReview<CR>", { desc = "CopilotChat: Review", silent = true })
    end,
    
    
    config = function(_, opts)
      local function center_config(w_ratio, h_ratio)
        local width = math.floor(vim.o.columns * w_ratio)
        local height = math.floor(vim.o.lines * h_ratio)
        return {
          layout = "float",
          relative = "editor",
          width = width,
          height = height,
          row = math.floor((vim.o.lines - height) / 2),
          col = math.floor((vim.o.columns - width) / 2),
          border = "rounded",
          zindex = 50,
        }
      end

      opts.window = center_config(0.8, 0.6)
      require("CopilotChat").setup(opts)

    end,
  },
}

