local jdtls = require('jdtls')
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)


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

-- jdtls specific features
vim.keymap.set("n", "<leader>ev", jdtls.extract_variable)
vim.keymap.set("v", "<leader>ev", function()
  jdtls.extract_variable(true)
end)
vim.keymap.set("n", "<leader>ec", jdtls.extract_constant)
vim.keymap.set("v", "<leader>ec", function()
  jdtls.extract_constant(true)
end)
vim.keymap.set("v", "<leader>em", function()
  jdtls.extract_method(true)
end)
vim.keymap.set("n", "<leader>oi", jdtls.organize_imports)
vim.keymap.set("n", "<leader>tc", jdtls.test_class)
vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method)
vim.keymap.set("n", "<leader>up", jdtls.update_project_config)

vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>ev", function()
	jdtls.extract_variable()
end)



