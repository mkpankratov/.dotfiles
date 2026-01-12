vim.api.nvim_create_user_command("Tscheck", function()
    vim.cmd('compiler tsc | setlocal makeprg=npx\\ tsc\\ --noEmit | make | copen')
end, {});
