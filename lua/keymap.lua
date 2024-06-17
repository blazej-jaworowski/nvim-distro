vim.g.mapleader = " "

vim.keymap.set("n", "<leader>j", "<C-w>h", opts)
vim.keymap.set("n", "<leader>k", "<C-w>j", opts)
vim.keymap.set("n", "<leader>l", "<C-w>k", opts)
vim.keymap.set("n", "<leader>;", "<C-w>l", opts)
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>c", "<C-w>s", opts)
vim.keymap.set("n", "<leader>x", ":q<CR>", opts)

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

if os.getenv("SSH_CLIENT") ~= nil then
    vim.keymap.set({"n", "v"}, "K", "10j", opts)
    vim.keymap.set({"n", "v"}, "L", "10k", opts)
end

vim.keymap.set({"n", "v"}, "j", "h", opts)
vim.keymap.set({"n", "v"}, "k", "j", opts)
vim.keymap.set({"n", "v"}, "l", "k", opts)
vim.keymap.set({"n", "v"}, ";", "l", opts)

vim.keymap.set("n", "<ESC>", ":noh<CR>", opts)

vim.keymap.set("n", "<C-u>", ":redo<CR>", opts)

vim.keymap.set("n", "m", "@a", opts)
