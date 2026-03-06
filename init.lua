require('huyvu8051')
vim.api.nvim_create_autocmd("FileType", {
	pattern = {'java', 'javascript', 'typescript', 'rust', 'lua'},
	callback = function()
		vim.treesitter.start()
	end,
})
