return {
  {"RRethy/nvim-treesitter-endwise"},
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { 'lua', 'ruby' },
        auto_install = true,
        highlight = {
          enable = true
        },
        endwise = { enable = true },
      }
    end
  },
}
