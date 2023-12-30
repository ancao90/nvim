return {
  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
