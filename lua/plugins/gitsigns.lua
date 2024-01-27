return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            on_attach = function(bufnr)
                local function map(mode, l, r, opts)
                    opts = opts or {
                        noremap = false,
                        silent = true,
                    }
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gitsigns.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gitsigns.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "<leader>ir", gitsigns.reset_hunk)
                map("v", "<leader>ir", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)

                map("n", "<leader>is", gitsigns.stage_hunk)
                map("v", "<leader>is", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)

                map("n", "<leader>iu", gitsigns.undo_stage_hunk)
                map("n", "<leader>ip", gitsigns.preview_hunk)
                map("n", "<leader>ib", function() gitsigns.blame_line { full = true } end)
                map("n", "<leader>id", gitsigns.diffthis)
            end
        })
    end
}
