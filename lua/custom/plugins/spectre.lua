vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre"
})

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		open_cmd = 'vnew | :vertical resize 60',

	}
}
