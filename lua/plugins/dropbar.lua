return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim", -- optional: fuzzy finder用
    build = "make",
  },
  event = "BufReadPost", -- ファイル読み込み時に起動
  config = function()
    local dropbar = require("dropbar")
    local dropbar_api = require("dropbar.api")

    -- Dropbarのセットアップ
    dropbar.setup({
      bar = {
        -- 表示 source を「パスのみ」に限定
        sources = function()
          return {
            require("dropbar.sources").path,
            -- require("dropbar.sources").treesitter, -- ← これは無効化
          }
        end,
      },
    })
    --  teloscopeで検索した時にも表示
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        local ok, api = pcall(require, "dropbar.api")
        if ok then
          pcall(api.update)
        end
      end,
    })


    -- 縦、横分割したときにもパンクズが表示される様に
    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
      callback = function()
        local ok, api = pcall(require, "dropbar.api")
        if ok then
          vim.defer_fn(function()
            pcall(api.update)
          end, 10)
        end
      end,
    })

    -- キーマッピング
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  end,
}

