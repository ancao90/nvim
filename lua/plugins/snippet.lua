return {
  { 
    'dcampos/cmp-snippy',
    config = function()
      require 'cmp'.setup {
        snippet = {
          expand = function(args)
            require 'snippy'.expand_snippet(args.body)
          end
        },

        sources = {
          { name = 'snippy' }
        }
      }
    end
  },
  { 
    'dcampos/nvim-snippy',
    config = function()
      require('snippy').setup({
        snippet_dirs = '~/.config/nvim/snippets',
        local_snippet_dir = '.snippets',
        hl_group = 'Search',
        enable_auto = false,
        scopes = {
          _ = { },

          lua = function(scopes)
            if vim.api.nvim_buf_get_name(0):find('_spec.lua$') then
              table.insert(scopes, 'busted')
            end
            return scopes
          end,

          lua = { '_', 'lua', 'html', 'javascript' },
          gitcommit = { 'gitcommit' },
        },
        mappings = {
          is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
          },
          nx = {
            ["<leader>x"] = "cut_text",
          },
        },
      })

    end
  }
}
