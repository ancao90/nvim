vim.g.mapleader = " "

-- map leader+w to save current file in normal mode
vim.keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true}) 

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

-- map Shift+L to move the cursor to the right tab
vim.keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { noremap = true, silent = true})

-- map Shift+H to move the cursor to the left tab
vim.keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { noremap = true, silent = true})

-- map Ctrl+C to close the current window
vim.keymap.set("n", "<C-C>", "<cmd>close<CR>", { noremap = true, silent = true})

--
-- Explorer
-- 

-- map leader+nf to toggle the Explorer and auto find and focus current file when it opens
vim.keymap.set("n", "<Leader>nf", "<cmd>Neotree toggle reveal<CR>", { noremap = true, silent = true })

-- map leader+nc to close the Explorer
vim.keymap.set("n", "<Leader>nc", "<cmd>Neotree close<CR>", { noremap = true, silent = true })


--
-- Fzf
--

-- map Ctrl+P to find files
vim.keymap.set("n", "<C-P>", "<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'default'} })<CR>", { noremap = true, silent = true })

-- map leader+s to search files
vim.keymap.set("n", "<Leader>s", "<cmd>lua require('fzf-lua').live_grep({ fzf_opts = {['--layout'] = 'default'} })<CR>", { noremap = true, silent = true })
