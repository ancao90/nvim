return {
  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { '<C-p>', function() require'fzf-lua'.files() end, desc = 'Find Files' },
      { '<Leader>gb', function() require'fzf-lua'.git_branches() end, desc = 'Git Branches' },
      { '<Leader>gc', function() require'fzf-lua'.git_commits() end, desc = 'Git Commits' },
      { '<Leader>gs', function() require'fzf-lua'.git_status() end, desc = 'Git Status' },
      { '<Leader>gt', function() require'fzf-lua'.git_stash() end, desc = 'Git Stash' },
    },
    config = function()
      local actions = require "fzf-lua.actions"
      local mm = require "mm"
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        files = {
          actions = {
            ["default"] = actions.file_edit,
          }
        },
        git = {
          branches = {
            actions = {
              ["default"] = actions.git_switch,
              ["ctrl-d"]  = { fn = mm.DeleteGitBranch, exec_silent = true, reload = true }
            },
          }
        }
      })
    end
  }
}
