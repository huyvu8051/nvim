local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
	defaults = {
		layout_config = {
			width = 0.9999,
		},
		layout_strategy = 'vertical'
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			} }
	}

})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>pd', function()
	builtin.diagnostics()
end
, {})


require("telescope").load_extension("ui-select")

