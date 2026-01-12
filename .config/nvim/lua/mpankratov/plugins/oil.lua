return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    config = function()
        require("oil").setup({
            columns = {},
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["<C-S-P>"] = "actions.preview",
                ["<C-p>"] = false,
            }
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
