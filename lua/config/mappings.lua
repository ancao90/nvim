vim.g.mapleader = " "

-- map leader+w to save current file in normal mode
vim.keymap.set("n", "<Leader>w", ":HopWord<CR>", { noremap = true, silent = true })

-- map Ctrl+S to save current file in normal mode and visual and select modes
vim.keymap.set({ "n", "v" }, "<C-S>", ":write<CR>", { noremap = true, silent = true })

-- map Ctrl+S to save current file in insert mode
vim.keymap.set("i", "<C-S>", "<esc>:write<CR>", { noremap = true, silent = true })

--map leader+y to copy to system clipboard in normal, visual and select modes
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = false })


-- map Ctrl+L to move the cursor to the right split
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })

-- map Ctrl+H to move the cursor to the left split
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })


-- map Ctrl+K to move the cursor to the above split
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })

-- map Ctrl+J to move the cursor to the below split
vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })

-- map Shift+L to move the cursor to the right tab
vim.keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { noremap = true, silent = true })

-- map Shift+H to move the cursor to the left tab
vim.keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { noremap = true, silent = true })

-- map Ctrl+C to close the current window
vim.keymap.set("n", "<C-C>", "<cmd>close<CR>", { noremap = true, silent = true })

-- map Ctrl+Q to quit the current window
vim.keymap.set("n", "<C-Q>", "<cmd>quit<CR>", { noremap = true, silent = true })

-- map leader+h to hide search highlight
vim.keymap.set("n", "<Leader>h", "<cmd>noh<CR>", { noremap = true, silent = true })

-- map leader+te to change one-liner let rspec to variable
vim.keymap.set("n", "<leader>te", "0wdf:wxa= <esc>wdwf}x")

-- map leader+tr to change one-liner let rspec to removing let
vim.keymap.set("n", "<leader>tr", "0df{<esc>f}x^==")

-- map leader+f to format file
vim.keymap.set('n', '<Leader>f', function()
  vim.lsp.buf.format { async = true }
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', '', {
  callback = function() require 'fzf-lua'.files() end,
  desc = "Find files"
})
vim.api.nvim_set_keymap("n", "<Leader>gb", '', {
  callback = function() require 'fzf-lua'.git_branches() end,
  desc = "Git branches"
})
vim.api.nvim_set_keymap("n", "<Leader>gc", '', {
  callback = function() require 'fzf-lua'.git_commits() end,
  desc = "Git commits"
})
vim.api.nvim_set_keymap("n", "<Leader>gt", '', {
  callback = function() require 'fzf-lua'.git_stash() end,
  desc = "Git stash"
})
vim.api.nvim_set_keymap("n", "<Leader>gp", "<cmd>!git push<CR>", { desc = "Git push" })
vim.api.nvim_set_keymap("n", "<Leader>gs", "<cmd>tab Git<CR>", { desc = "Git summary" })

vim.api.nvim_set_keymap("n", "<Leader>se", '', {
  callback = function() require 'fzf-lua'.live_grep() end,
  desc = "Simple search"
})
vim.api.nvim_set_keymap('v', '<Leader>se', '', {
  callback = function() require 'fzf-lua'.grep_visual() end,
  desc = 'Simple search'
})
vim.api.nvim_set_keymap('n', '<Leader>sc', '', {
  callback = function()
    require 'fzf-lua'.grep({
      no_esc = true,
      search = [[(^|\s)]] .. [[(class|module)\s]] .. vim.fn.expand("<cword>") .. [[($|\s)]],
    })
  end,
  desc = 'Search Ruby class or module definition'
})
vim.api.nvim_set_keymap('v', '<Leader>sc', '', {
  callback = function()
    require 'fzf-lua'.grep({
      no_esc = true,
      search = [[(^|\s)]] .. [[(class|module)\s]] .. require 'fzf-lua.utils'.get_visual_selection() .. [[($|\s)]],
    })
  end,
  desc = 'Search Ruby class or module definition'
})

vim.api.nvim_set_keymap('n', "<Leader>j", '', {
  callback = function() require 'treesj'.toggle() end,
  desc = "Toggle TreeSJ split and join",
})

vim.api.nvim_set_keymap("n", "<Leader>tt", "<cmd>TestNearest<CR>", { desc = "Test Nearest" })
vim.api.nvim_set_keymap("n", "<Leader>ty", "<cmd>TestNearest -strategy=basic<CR>", { desc = "Test Nearest with strategy basic" })
vim.api.nvim_set_keymap("n", "<Leader>tf", "<cmd>TestFile<CR>", { desc = "Test File" })
vim.api.nvim_set_keymap("n", "<Leader>tl", "<cmd>TestLast<CR>", { desc = "Test Last" })

-- map leader+lr to restart lsp
vim.keymap.set("n", "<Leader>lr", "<cmd>LspRestart<CR>:echo 'Lsp reloaded!'<CR>", { noremap = true, silent = true })

-- request http url at the cursor
vim.keymap.set("n", "<Leader>r", "<cmd>lua require('rest-nvim').run()<CR>")

-- fixing rubocop offenses: transform let! to before
vim.keymap.set("n", "<leader>b", "0wcWbefore<ESC><cmd>:w<CR>")

-- exit terminal mode when run test
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>")
vim.api.nvim_set_keymap("n", "<Leader>z", "<cmd>MaximizerToggle<CR>", { desc = "Toggle maximizer" })
vim.api.nvim_set_keymap("n", "<Leader>nf", "<cmd>Neotree toggle reveal<CR>", { desc = "Toggle neotree with revealing" })
