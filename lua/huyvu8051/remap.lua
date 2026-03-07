vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>ev", function()
	require("jdtls").extract_variable()
end)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d', "<C-d>zz")
vim.keymap.set('n', '<C-u', "<C-u>zz")

vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set('n', '<leader>wn', "<cmd>silent !tmux neww tmux-sessionizer<CR>")


vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references)
