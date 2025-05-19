-- lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true, -- ← ✨ これが blame 表示！
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 行末に表示
        delay = 300,           -- 遅延ミリ秒
        ignore_whitespace = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    })
  end,
}
