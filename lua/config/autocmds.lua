-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank({ timeout = 200 })
   end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".rubocop_todo.yml", ".rubocop.yml" },
  callback = function()
    vim.cmd([[LspRestart]])
    vim.cmd([[echo 'Lsp Restarted.']])
  end
})
