-- ~/.config/nvim/after/plugin/neotree.lua
require("neo-tree").setup({
  window = {
    position = "left",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- show dotfiles and other hidden files
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- enable folder expanders
    },
  },
})

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

