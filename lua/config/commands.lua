vim.api.nvim_create_user_command("PackAdd", function(opts)
  vim.pack.add(opts.fargs)
end, { nargs = '+', desc = "Add plugins (:PackAdd user1/repo1 user2/repo2)" })

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = '+', desc = "Delete plugins (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackDel", function(opts)
  -- checks if any argument is passed
  if opts.args:match("%S") then
    -- update only specified plugins
    local plugins = vim.split(opts.args, "%s+", { trimempty = true })
    vim.pack.update(plugins)
  else
    -- update all plugins
    vim.pack.update()
  end
end, { nargs = '*', desc = "Update all plugins or specific ones" })
