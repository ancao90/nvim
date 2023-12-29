local M = {}

M.DeleteGitBranch = function(selected)
  vim.cmd(string.format("G branch -d %s | echo", selected[1]))
  -- vim.cmd("echo 'hello'")
end

M.SearchRubyClassOrModule = function(keyword)
  local fzf_lua = require 'fzf-lua'

  fzf_lua.grep({
    no_esc = true,
    search = [[(^|\s)]] .. [[(class|module)\s]] .. keyword .. [[($|\s)]],
    fzf_opts = {['--layout'] = 'default'}
  })
end
return M
