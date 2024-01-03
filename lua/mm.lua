local M = {}

M.DeleteGitBranch = function(selected)
  vim.cmd(string.format('G branch -d %s | echo', selected[1]))
  -- vim.cmd("echo 'hello'")
end

M.alternate = function(path, cword)
  local _, _, model = string.find(path, 'app/models/([%a_]+).rb')

  if model == nil then
    local _, _, controller = string.find(path, 'app/controllers/([%a_]+)_controller.rb')
    if controller == nil then
      local _, _, controller = string.find(path, 'spec/requests/([%a_]+)/%a+_spec.rb')
      if controller == nil then
        local _, _, model = string.find(path, 'spec/models/([%a_]+)_spec.rb')
        if model == nil then
          return nil
        else
          return 'app/models/' .. model .. '.rb'
        end
      else
        return 'app/controllers/' .. controller .. '_controller.rb'
      end
    else
      return 'spec/requests/' .. controller .. '/' .. cword .. '_spec.rb'
    end
  else
    return 'spec/models/' .. model .. '_spec.rb'
  end
end

return M
