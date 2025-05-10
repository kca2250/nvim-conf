return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot", -- lazy-load したい場合はこれ
  build = ":Copilot auth", -- 初回認証用
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
    })
  end,
}

