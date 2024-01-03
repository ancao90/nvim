return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { 'nvim-telescope/telescope.nvim',       tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } }
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Go to declar"
      keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)
      keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "<Leader>rs", ":LspRestart<CR>", opts)
    end


    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            enable = false
          },
        }
      }
    })

    -- lspconfig["ruby_ls"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })
    lspconfig["rubocop"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        safeAutocorrect =  false
      }
    })
  end
}
