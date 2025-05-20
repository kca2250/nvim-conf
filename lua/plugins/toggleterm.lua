-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 最新安定版
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]], -- Ctrl+\ で開閉
      direction = "float",      -- または "horizontal", "vertical", "tab"
      float_opts = {
        border = "curved",      -- "single" | "double" | "shadow" など
      },
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    })
  end,
}
