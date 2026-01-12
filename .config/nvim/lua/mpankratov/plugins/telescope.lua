return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },

    config = function()
        require('telescope').setup({})
        require('telescope').load_extension("live_grep_args")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>ph', builtin.git_bcommits, {})
        vim.keymap.set('n', 'gr', builtin.lsp_references, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>pgs', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = function() return { "--no-ignore" } end
            })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {});
        vim.keymap.set('n', '<leader>pd', "<cmd>Telescope diagnostics bufnr=0<cr>", {})
        vim.keymap.set('n', '<leader>pg', require('telescope').extensions.live_grep_args.live_grep_args, {})
    end
}
