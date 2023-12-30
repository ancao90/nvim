return {
  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { '<C-p>',      function() require 'fzf-lua'.files() end,        desc = 'Find Files' },
      { '<Leader>gb', function() require 'fzf-lua'.git_branches() end, desc = 'Git Branches' },
      { '<Leader>gc', function() require 'fzf-lua'.git_commits() end,  desc = 'Git Commits' },
      { '<Leader>gt', function() require 'fzf-lua'.git_stash() end,    desc = 'Git Stash' },
      { '<Leader>se', function() require 'fzf-lua'.live_grep() end,    desc = 'Simple search' },
      { '<Leader>se', function() require 'fzf-lua'.grep_visual() end,  desc = 'Simple search', mode = 'v', },
      {
        '<Leader>sc',
        function()
          require 'fzf-lua'.grep({
            no_esc = true,
            search = [[(^|\s)]] .. [[(class|module)\s]] .. vim.fn.expand("<cword>") .. [[($|\s)]],
          })
        end,
        desc = 'Search Ruby class or module definition'
      },
      {
        '<Leader>sc',
        function()
          require 'fzf-lua'.grep({
            no_esc = true,
            search = [[(^|\s)]] .. [[(class|module)\s]] .. require 'fzf-lua.utils'.get_visual_selection() .. [[($|\s)]],
          })
        end,
        mode = 'v',
        desc = 'Search Ruby class or module definition'
      },
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
