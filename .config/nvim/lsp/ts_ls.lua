-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua
-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md

return {
    cmd = {
        "typescript-language-server",
        "--stdio",
    },
    filetypes = {
        "javascript",
        "javascript.tsx",
        "javascriptreact",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
    },
    root_markers = {
        ".git",
        "jsconfig.json",
        "package.json",
        "tsconfig.json",
    },

    init_options = { hostInfo = "neovim" },
    single_file_support = true,
    settings = {
        typescript = {
            format = {
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false
            }
        },
        javascript = {
            format = {
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false
            }
        }
    }
}
