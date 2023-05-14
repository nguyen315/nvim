require("neo-tree").setup({
	filesystem = {
		bind_to_cwd = false,
		follow_current_file = true,
		use_libuv_file_watcher = true,
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		}
	},
	window = {
		mappings = {
			["<space>"] = "none",
		},
	},
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted   = "✖", -- this can only be used in the git_status source
				renamed   = "", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored   = "",
				unstaged  = "",
				staged    = "",
				conflict  = "",
			}
		},
	},
})
