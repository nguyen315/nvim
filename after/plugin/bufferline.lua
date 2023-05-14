vim.opt.termguicolors = true
local bufferline = require('bufferline')
bufferline.setup {
	options = {
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		--
		right_mouse_command = "bdelete! %d",
		show_close_icon = false,
		show_tab_indicators = true,
	},
}
