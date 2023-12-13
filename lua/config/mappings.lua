vim.g.mapleader = " "

-- map leader+w to save current file in normal mode
vim.keymap.set("n", "<Leader>w", ":HopWord<CR>", { noremap = true, silent = true}) 

-- map Ctrl+S to save current file in normal mode and visual and select modes
vim.keymap.set({"n", "v"}, "<C-S>", ":write<CR>", { noremap = true, silent = true })

-- map Ctrl+S to save current file in insert mode
vim.keymap.set("i", "<C-S>", "<esc>:write<CR>", { noremap = true, silent = true})

--map leader+y to copy to system clipboard in normal, visual and select modes
vim.keymap.set({"n", "v"}, "<Leader>y", '"+y', { noremap = true, silent = false })


-- map Ctrl+L to move the cursor to the right split
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true})

-- map Ctrl+H to move the cursor to the left split
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true})


-- map Ctrl+K to move the cursor to the above split
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true})

-- map Ctrl+J to move the cursor to the below split
vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true})

-- map Shift+L to move the cursor to the right tab
vim.keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { noremap = true, silent = true})

-- map Shift+H to move the cursor to the left tab
vim.keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { noremap = true, silent = true})

-- map Ctrl+C to close the current window
vim.keymap.set("n", "<C-C>", "<cmd>close<CR>", { noremap = true, silent = true})

-- map Ctrl+Q to quit the current window
vim.keymap.set("n", "<C-Q>", "<cmd>quit<CR>", { noremap = true, silent = true})

-- map leader+h to hide search highlight
vim.keymap.set("n", "<Leader>h", "<cmd>noh<CR>", { noremap = true, silent = true})

-- map leader+te to change one-liner let rspec to variable
vim.keymap.set("n", "<leader>te", "0wdf:wxa= <esc>wdwf}x")

-- map leader+tr to change one-liner let rspec to removing let
vim.keymap.set("n", "<leader>tr", "0df{<esc>f}x^==")

-- map leader+f to format file
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- map Ctrl+Shift+k to increase size of the window
vim.keymap.set("n", "<C-S-k>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
--
-- map Ctrl+Shift+j to decrease size of the window
vim.keymap.set("n", "<C-S-j>", "<cmd>resize -2<CR>", { noremap = true, silent = true })


--
-- Fzf
--

-- map Ctrl+P to find files
vim.keymap.set("n", "<C-P>", "<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'default'} })<CR>", { noremap = true, silent = true })

-- Find git branches
vim.keymap.set("n", "<C-G>b", "<cmd>lua require('fzf-lua').git_branches()<CR>", { noremap = true, silent = true })
-- Find git stashes
vim.keymap.set("n", "<C-G>s", "<cmd>lua require('fzf-lua').git_stash()<CR>", { noremap = true, silent = true })
-- View git status
vim.keymap.set("n", "<C-G>t", "<cmd>lua require('fzf-lua').git_status()<CR>", { noremap = true, silent = true })

-- map leader+s to search files
vim.keymap.set("n", "<Leader>s", "<cmd>lua require('fzf-lua').live_grep({ fzf_opts = {['--layout'] = 'default'} })<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<Leader>s", "<cmd>lua require('fzf-lua').grep_visual({ fzf_opts = {['--layout'] = 'default'} })<CR>", { noremap = true, silent = true })


--
-- TreeSJ
--
-- map leader+j to toggle split and join
vim.keymap.set("n", "<Leader>j", "<cmd>lua require('treesj').toggle()<CR>", { noremap = true, silent = true })


--
-- Test
--
vim.keymap.set("n", "<Leader>tt", "<cmd>TestNearest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tf", "<cmd>TestFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tl", "<cmd>TestLast<CR>", { noremap = true, silent = true })

-- map leader+lr to restart lsp
vim.keymap.set("n", "<Leader>lr", "<cmd>LspRestart<CR>:echo 'Lsp reloaded!'<CR>", { noremap = true, silent = true })

-- request http url at the cursor
vim.keymap.set("n", "<Leader>r", "<cmd>lua require('rest-nvim').run()<CR>")

-- open git
vim.keymap.set("n", "<C-G>", "<cmd>Git<CR>", { noremap = true, silent = true })
