return {
    "dstein64/vim-startuptime",
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    "folke/which-key.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                sync_install = false,
                highlight = { enable = true },
            })
        end,
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>z", "<CMD>UndotreeToggle<CR>" },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup()

            local api = require("nvim-tree.api")
            vim.keymap.set("n", "<C-E>", api.tree.toggle)
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function ()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]],
                direction = 'float',
            })
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function ()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function ()
            local neoscroll = require("neoscroll")
            neoscroll.setup({mappings = {}})

            local modes = {"n", "v"}
            for _,m in pairs(modes) do
                vim.keymap.set(m, "L", function () neoscroll.scroll(50, true, 100) end, opts)
                vim.keymap.set(m, "J", function () neoscroll.scroll(10, true, 100) end, opts)
                vim.keymap.set(m, "K", function () neoscroll.scroll(-10, true, 100) end, opts)
                vim.keymap.set(m, "H", function () neoscroll.scroll(-50, true, 100) end, opts)
            end
        end
    }
    -- TODO: leap.nvim, null-ls linters, gitsigns, diffview
    -- TODO: UI
}
