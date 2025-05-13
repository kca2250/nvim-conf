return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4.1-mini", -- your desired model (or use gpt-4o, etc.)
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0.2,
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub:get_active_servers_prompt()
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,

    disabled_tools = {
      "list_files",
      "search_files",
      "read_file",
      "create_file",
      "rename_file",
      "delete_file",
      "create_dir",
      "rename_dir",
      "delete_dir",
      "bash",
    },
  },
  build = "make",
  
  -- keymaps
  keys = {
    -- 💬 チャット系
    { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Avante: 質問する" },
    { "<leader>ac", "<cmd>AvanteAskCodebase<CR>", desc = "Avante: コードベースに質問" },
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "Avante: 新しいチャット" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante: チャット履歴" },
    { "<leader>ax", "<cmd>AvanteClear<CR>", desc = "Avante: チャット履歴を削除" },

    -- ✂️ 編集・リファクタ系
    { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Avante: 選択範囲を編集", mode = { "v" } },

    -- 🔎 コード探索系
    { "<leader>as", "<cmd>AvanteFindSymbolReferences<CR>", desc = "Avante: 関連シンボル検索" },
    { "<leader>ar", "<cmd>AvanteShowRepoMap<CR>", desc = "Avante: リポジトリ構造マップ" },

    -- 🧠 モデル・プロバイダー管理
    { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Avante: モデル一覧" },
    { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Avante: プロバイダー切替" },
    { "<leader>aw", "<cmd>AvanteSwitchSelectorProvider<CR>", desc = "Avante: セレクター切替" },

    -- 🧰 UI操作
    { "<leader>ao", "<cmd>AvanteOpen<CR>", desc = "Avante: サイドバーを開く" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Avante: フォーカス切替" },
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Avante: サイドバー表示切替" },
    { "<leader>au", "<cmd>AvanteRefresh<CR>", desc = "Avante: サイドバーを再描画" },

    -- 🛑 強制停止
    { "<leader>aq", "<cmd>AvanteStop<CR>", desc = "Avante: 処理を強制停止" },
  },


  dependencies = {
    "ravitemer/mcphub.nvim",
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

