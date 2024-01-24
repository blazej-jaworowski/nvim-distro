return {
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

            -- TODO: ensure libs

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
    "akinsho/toggleterm.nvim", -- TODO: keymap
    -- TODO: oil.nvim, leap.nvim, null-ls linters, neoscroll, nvim-autopairs, gitisgns, diffview, nvim-we-icons?
    -- TODO: UI
}
