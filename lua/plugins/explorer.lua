return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = true,
    keys = { 
      { '<Leader>nf', '<cmd>Neotree toggle reveal<CR>', 'n', { noremap = true, silent = true} },
      { '<Leader>nc', '<cmd>Neotree close<CR>', 'n', { noremap = true, silent = true} }
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          window = {
            mappings = {
              ["<F5>"] = "refresh",
              ["o"] = "open",
              ["oc"] = "none",
              ["od"] = "none",
              ["og"] = "none",
              ["om"] = "none",
              ["on"] = "none",
              ["os"] = "none",
              ["ot"] = "none",
            }
          }
        }
      })
    end
  }
}

