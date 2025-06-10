require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', {
			'diagnostics',
			symbols = {
				error = ' ',
				warn = ' ',
				info = ' ',
				hint = ' ',
			}
		} },
		lualine_c = { { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } }, },
		lualine_x = { {
			function()
				-- github copilot icon
				local iconMap = {
					[""] = "󱚣 ",
					["Normal"] = "󱚣 ",
					["InProgress"] = " ",
				}

				local status = require("copilot.api").status.data
				local icon = iconMap[status.status] or "󱚣 "
				return icon .. (status.message or "")
			end,
			cond = function()
				local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
				return ok and #clients > 0

			end,
			color = {
				fg = "#000000",
				bg = "#ffffff",
				gui = "bold",
			},
		} },
		lualine_y = { 'progress' },
		lualine_z = {
			{
				function()
				    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_get_option(buf, 'modified') then
					    return '' -- any message or icon
					end
				    end
				    return ''
				end,
			},
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})


