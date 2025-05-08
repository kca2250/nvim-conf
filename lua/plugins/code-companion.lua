return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
   opts = {
    language = "japanese",
    provider = "openai",
    strategies = {
      chat = {
        adapter = 'openai'
      },
      inline = {
        adapter = 'openai'
      },
    },
    display = {
      layout = "right",
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",
        provider = "telescope", -- "default" | "telescope" | "mini_pick" | "scacks"
        opts = {
          show_default_actions = true,
          show_default_prompt_library = true,
        },
      },
    },
  },
  config = true,
}
