-- ~/.config/nvim/after/plugin/neotree.lua
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "left",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- show dotfiles and other hidden files
    },
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- enable folder expanders
    },
  },
})

vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

