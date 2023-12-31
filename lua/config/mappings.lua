vim.g.mapleader = " "

vim.keymap.set({ 'n', 'v', 'i' }, '<C-S>', '<esc><cmd>write<CR>', { desc = 'Save file'})
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = 'Focus the right split' })
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = 'Focus the left split' })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = 'Focus the above split' })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = 'Focus the below split' })
vim.keymap.set("n", "<C-c>", "<cmd>close<CR>", { desc = 'Close the current window' })
vim.keymap.set("n", "<C-q>", "<cmd>quit<CR>", { desc = 'Quit the current window' })
vim.keymap.set('t', '<C-o>', "<C-\\><C-n>", { desc = 'Exit terminal mode when run test' })
vim.keymap.set('n', '<C-p>', function() require 'fzf-lua'.files() end, { desc = 'Find files' })
vim.keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { desc = 'Focus the right tab' })
vim.keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { desc = 'Focus the left tab' })

vim.keymap.set('n', '<Leader>gb', function() require 'fzf-lua'.git_branches() end, { desc = 'Git branches' })
vim.keymap.set('n', '<Leader>gc', function() require 'fzf-lua'.git_commits() end, { desc = 'Git commits' })
vim.keymap.set('n', '<Leader>gt', function() require 'fzf-lua'.git_stash() end, { desc = 'Git stash' })
vim.keymap.set('n', '<Leader>gp', '<cmd>!git push<CR>', { desc = 'Git push' })
vim.keymap.set('n', '<Leader>gs', '<cmd>tab Git<CR>', { desc = 'Git summary' })

vim.keymap.set('n', '<Leader>se', function() require 'fzf-lua'.live_grep() end, { desc = 'Simple search' })
vim.keymap.set('v', '<Leader>se', function() require 'fzf-lua'.grep_visual() end, { desc = 'Simple search' })
vim.keymap.set('n', '<Leader>sc', function()
    require 'fzf-lua'.grep({
      no_esc = true,
      search = [[(^|\s)]] .. [[(class|module)\s]] .. vim.fn.expand("<cword>") .. [[($|\s)]],
    })
  end, {
    desc = 'Search Ruby class or module definition'
  })
vim.keymap.set('v', '<Leader>sc', function()
    require 'fzf-lua'.grep({
      no_esc = true,
      search = [[(^|\s)]] .. [[(class|module)\s]] .. require 'fzf-lua.utils'.get_visual_selection() .. [[($|\s)]],
    })
  end, {
  desc = 'Search Ruby class or module definition'
})

vim.keymap.set("n", "<Leader>tt", "<cmd>TestNearest<CR>", { desc = "Test Nearest" })
vim.keymap.set("n", "<Leader>ty", "<cmd>TestNearest -strategy=basic<CR>", { desc = "Test Nearest with strategy basic" })
vim.keymap.set("n", "<Leader>tf", "<cmd>TestFile<CR>", { desc = "Test File" })
vim.keymap.set("n", "<Leader>tl", "<cmd>TestLast<CR>", { desc = "Test Last" })
vim.keymap.set("n", "<leader>tv", "0wdf:wxa= <esc>wdwf}x", { desc = 'Transform let! to variable'})
vim.keymap.set("n", "<leader>tr", "0df{<esc>f}x^==", { desc = 'Remove header of let!'})
vim.keymap.set('n', '<Leader>tb', "0wcWbefore<ESC><cmd>:w<CR>", { desc = 'Transform let! to before' })

vim.keymap.set('n', '<Leader>z', "<cmd>MaximizerToggle<CR>", { desc = "Toggle maximizer" })
vim.keymap.set('n', '<Leader>n', '<cmd>Neotree toggle reveal<CR>', { desc = "Toggle neotree with revealing" })
vim.keymap.set('n', '<Leader>j', function() require 'treesj'.toggle() end, { desc = "Toggle TreeSJ split and join" })
vim.keymap.set("n", '<Leader>r', function() require 'rest-nvim'.run() end, { desc = "Request http url at the cursor" })
vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, { desc = 'Format file'})
vim.keymap.set('n', '<Leader>h', '<cmd>noh<CR>', { desc = 'Hide search highlight' })
vim.keymap.set('n', '<Leader>w', ':HopWord<CR>', { desc = 'Enter HopWord mode'})
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = 'Copy to system clipboard'})
vim.keymap.set("n", "<C-f>", function ()
  local alternative_path = require 'mm'.alternate(vim.fn.expand("%"))
  vim.cmd("vsplit "..alternative_path)
end, { desc = 'Copy to system clipboard'})
