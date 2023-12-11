local M = {}

M.DeleteGitBranch = function(selected)
  vim.cmd(string.format("G branch -d %s | echo", selected[1]))
  -- vim.cmd("echo 'hello'")
end

return M
