require("spectre").setup({
	open_cmd = 'vnew',
})

vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre"
})
