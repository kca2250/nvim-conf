return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "openai",
    openai = {
      model = "gpt-4o",
      timeout = 30000,
      max_completion_tokens = 8192,
    },
  },

  -- ui custom
  config = function(_, opts)
    require("avante").setup(opts)

    -- 🎨 UI ハイライトのカスタマイズ
    local hl = vim.api.nvim_set_hl
    hl(0, "AvantePromptInput", { fg = "#ffffff" })
    hl(0, "AvantePromptInputBorder", { fg = "#89b4fa" })
    hl(0, "AvanteConflictCurrent", { fg = "#fab387", bold = true })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "#1e1e2e" })
  end,

  sidebar = {
    width = 60
  },
  
  build = "make",

  keys = {
    -- 🔍 質問系
    { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Avante: 質問する" },
    { "<leader>ac", "<cmd>AvanteAskCodebase<CR>", desc = "Avante: コードベースに質問" },

    -- ✂️ 編集・リファクタ系
    { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Avante: 選択範囲を編集", mode = { "v" } },

    -- 🔎 探索系
    { "<leader>as", "<cmd>AvanteFindSymbolReferences<CR>", desc = "Avante: 関連シンボル検索" },
    { "<leader>ar", "<cmd>AvanteShowRepoMap<CR>", desc = "Avante: リポジトリ構造マップ" },

    -- 💬 チャット操作
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "Avante: 新しいチャットを開始" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante: チャット履歴を見る" },
    { "<leader>ax", "<cmd>AvanteClear<CR>", desc = "Avante: 現在のチャット履歴を削除" },

    -- 🧠 UI操作
    { "<leader>ao", "<cmd>AvanteOpen<CR>", desc = "Avante: サイドバーを開く" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Avante: フォーカス切り替え" },
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Avante: サイドバー表示切替" },
    { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Avante: モデル一覧を表示" },

    -- 🔄 その他
    { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Avante: プロバイダー切替" },
    { "<leader>aw", "<cmd>AvanteSwitchSelectorProvider<CR>", desc = "Avante: セレクタ切替" },
    { "<leader>aq", "<cmd>AvanteStop<CR>", desc = "Avante: 処理を強制停止" },
    { "<leader>au", "<cmd>AvanteRefresh<CR>", desc = "Avante: UIを再描画" },
  },
}

