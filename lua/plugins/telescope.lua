-- lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local builtin = require("telescope.builtin")

    -- 🔁 修正ポイント：右に vsplit
    local function vsplit_right(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.cmd("rightbelow vsplit " .. vim.fn.fnameescape(entry.path))
    end

    local function split_below(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.cmd("belowright split " .. vim.fn.fnameescape(entry.path))
    end

    require("telescope").setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },
        file_ignore_patterns = {
          "node_modules/",
          "%.git/",
          "dist/",
          "build/",
          "%.next/",
          "vendor/",
          "%.lock",
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-v>"] = vsplit_right,
            ["<C-x>"] = split_below,
          },
          n = {
            ["<C-v>"] = vsplit_right,
            ["<C-x>"] = split_below,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          theme = "dropdown", -- 💡 ドロップダウンスタイルでバッファ内検索
        },
      },
    })

    -- 🔑 キーマップ
    vim.keymap.set("n", "<leader>fg", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" }) -- 🆕 追加！
    -- ファイル内に定義されている関数を検索
    vim.keymap.set("n", "<leader>fs", builtin.treesitter, { desc = "現在ファイルの関数/構造を一覧ジャンプ" })

  end,
}

