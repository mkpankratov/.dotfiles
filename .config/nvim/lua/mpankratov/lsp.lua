vim.lsp.enable('ts_ls')
vim.lsp.enable('cssls')
vim.lsp.enable('cssmodules_ls')
vim.lsp.enable('dockerls')
vim.lsp.enable('eslint')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
