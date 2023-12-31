local M = {}

M.DeleteGitBranch = function(selected)
  vim.cmd(string.format("G branch -d %s | echo", selected[1]))
  -- vim.cmd("echo 'hello'")
end

M.alternate = function(path)
  local _, _, model = string.find(path, "app/models/([%a_]+).rb")

  return "spec/models/"..model.."_spec.rb"
end

return M
