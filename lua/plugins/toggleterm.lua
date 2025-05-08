return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      -- ここで好みに応じてカスタマイズできるよ！
      direction = "horizontal", -- "vertical" / "tab" / "float" も選べる
      size = 15,
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      dir = 'git_dir',
    }
  end,
}
