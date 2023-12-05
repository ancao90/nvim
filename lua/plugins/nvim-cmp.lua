return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = false}),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" }
      })
    })
  end
}
-- return {
--   {
--     'dcampos/cmp-snippy',
--     config = function()
--       require 'cmp'.setup {
--         snippet = {
--           expand = function(args)
--             require 'snippy'.expand_snippet(args.body)
--           end
--         },

--         sources = {
--           { name = 'snippy' }
--         }
--       }
--     end
--   },
--   {
--     'dcampos/nvim-snippy',
--     config = function()
--       require('snippy').setup({
--         snippet_dirs = '~/.config/nvim/snippets',
--         local_snippet_dir = '.snippets',
--         hl_group = 'Search',
--         enable_auto = false,
--         scopes = {
--           _ = {},

--           lua = function(scopes)
--             if vim.api.nvim_buf_get_name(0):find('_spec.lua$') then
--               table.insert(scopes, 'busted')
--             end
--             return scopes
--           end,

--           lua = { '_', 'lua', 'html', 'javascript' },
--           gitcommit = { 'gitcommit' },
--         },
--         mappings = {
--           is = {
--             ["<Tab>"] = "expand_or_advance",
--             ["<S-Tab>"] = "previous",
--           },
--           nx = {
--             ["<leader>x"] = "cut_text",
--           },
--         },
--       })
--     end
--   }
-- }
