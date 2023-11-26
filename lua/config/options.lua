vim.opt.number = true -- Precede each line with its line number
vim.opt.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

vim.opt.shiftwidth = 0 -- Number of spaces to use for each step of (auto)indent. When zero the 'tabstop' value will be used.
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of space to insert a <Tab>.

vim.opt.splitright = true -- Splitting a window will put the new window right of the current one.
vim.opt.splitbelow = true -- Splitting a window will put the new window below the current one.

vim.g['test#strategy'] = 'neovim'

vim.opt.cursorline = true -- Highlight the text line of the cursor
vim.opt.cursorlineopt = "line,number"

vim.opt.colorcolumn = '80,120'
