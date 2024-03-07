return {
    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function ()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "lua_ls", "clangd", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function ()
            local lspconfig = require("lspconfig")

            local on_attach = function (console, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

                vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "<C-p>", vim.lsp.buf.signature_help, bufopts)

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

                vim.keymap.set("n", "<leader>ft", function ()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
                vim.keymap.set("v", "<leader>ft", function ()
                    vim.lsp.buf.format({
                        async = true,
                        range = nil
                    })
                end, bufopts)
            end


            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.pylsp.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        configurationSources = { "flake8" },
                    }
                }
            })

            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.cmake.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    }
}
