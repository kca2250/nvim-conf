-- lua/core/commands.lua

vim.api.nvim_create_user_command("CreateNote", function()
  local note_dir = vim.fn.expand("~/development/documents/nippou/") -- ← 自分の保存先に変えてね！
  local date = os.date("%Y-%m-%d")
  local filename = note_dir .. "/" .. date .. ".md"

  -- フォルダがなければ作成
  if vim.fn.isdirectory(note_dir) == 0 then
    vim.fn.mkdir(note_dir, "p")
  end

  -- ファイルが存在しない場合だけテンプレートを書く
  local file_exists = vim.fn.filereadable(filename) == 1

  vim.cmd("edit " .. filename)

  if not file_exists then
    local lines = {
      "# " .. date .. " のノート",
      "",
      "## 全体",
      "",
      "## メモエリア",
      "",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
end, {})
