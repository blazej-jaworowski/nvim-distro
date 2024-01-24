return {
    {
        "williamboman/mason.nvim",
        config = {
            require("mason").setup()
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "lua_ls", "clangd", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- TODO: make this better
            local lspconfig = require('lspconfig')

            -- Customized on_attach function
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', '<C-[>', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, bufopts)

                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<leader>ft', function() vim.lsp.buf.format { async = true } end, bufopts)

                vim.keymap.set('v', '<leader>ft', function() vim.lsp.buf.format {
                    async = true,
                    range = nil
                } end, bufopts)
            end

            lspconfig.pylsp.setup({
                on_attach = on_attach,
                settings = {
                    pylsp = {
                        configurationSources = { 'flake8' },
                    }
                }
            })

            lspconfig.clangd.setup({ on_attach = on_attach })
            lspconfig.cmake.setup({ on_attach = on_attach })
            lspconfig.lua_ls.setup({ on_attach = on_attach })
            lspconfig.rust_analyzer.setup({ on_attach = on_attach })
        end
    }
}
