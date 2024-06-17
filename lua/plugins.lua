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
                ensure_installed = {
                    "c", "query", "vim", "rust", "bash",
                    "yaml", "toml", "markdown", "cmake"
                },
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
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
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
                shell = "/usr/bin/zsh",
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
        enabled = (os.getenv("SSH_CLIENT") == nil),
        config = function ()
            local neoscroll = require("neoscroll")
            neoscroll.setup({mappings = {}})

            vim.keymap.set({"n", "v"}, "K", function () neoscroll.scroll(10, true, 100) end, opts)
            vim.keymap.set({"n", "v"}, "L", function () neoscroll.scroll(-10, true, 100) end, opts)
        end
    },
    {
        "vim-airline/vim-airline-themes",
        dependencies = {
            "vim-airline/vim-airline",
        },
        config = function ()
            vim.api.nvim_command(":AirlineTheme base16_gruvbox_dark_soft")
        end
    },
    {
        "ggandor/leap.nvim",
        config = function ()
            vim.keymap.set({"n", "v"}, "f", "<Plug>(leap-forward)")
            vim.keymap.set({"n", "v"}, "F", "<Plug>(leap-backward)")
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure()
        end
    },
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup()
        end,
    },
    {
        "LunarVim/bigfile.nvim",
    }
}
