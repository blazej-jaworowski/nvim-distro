return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function ()
        require('telescope').setup {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            }
          }
        }

        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<space>ff', builtin.find_files, {})
        vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<space>fd', builtin.git_status, {})
    end,
}
