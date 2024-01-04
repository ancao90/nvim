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
          local _, _, mailer = string.find(path, 'app/mailers/([%a_/]+).rb')
          if mailer == nil then
            local _, _, spec_mailer = string.find(path, 'spec/mailers/([%a_/]+)_spec.rb')
            if spec_mailer == nil then
              return nil
            else
              return 'app/mailers/' .. spec_mailer .. '.rb'
            end
          else
            return 'spec/mailers/' .. mailer .. '_spec.rb'
          end
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

M.CommitIncrementally = function()
  local output = vim.api.nvim_exec2('!git log -n 1 --format=\"\\%s\"', { output = true })
  local msg = vim.split(output.output, '\n')
  if (msg[3] == 'wip') then
    print('Already wip. Commit ammend')
    vim.api.nvim_exec2('!git add . && git commit --amend --no-edit', {})
  else
    print('No wip found. Create wip commit')
    vim.api.nvim_exec2('!git add . && git commit -m wip', {})
  end
end

return M
