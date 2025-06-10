-- ~/.config/nvim/after/plugin/treesitter.lua

vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Languages to install for Treesitter
    ensure_installed = { 'go', 'lua', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'ruby' },
    auto_install = false,      -- Auto-install languages if not already installed
    sync_install = false,      -- Install languages asynchronously
    ignore_install = {},       -- Parsers to ignore installing
    modules = {},              -- Additional Treesitter modules if needed

    highlight = { enable = true },
    indent = { enable = true },

    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = '<c-space>',
    --     node_incremental = '<c-space>',
    --     scope_incremental = '<c-s>',
    --     node_decremental = '<M-space>',
    --   },
    -- },

    -- textobjects = {
    --   select = {
    --     enable = true,
    --     lookahead = true,  -- Automatically jump forward to textobj
    --     keymaps = {
    --       ['aa'] = '@parameter.outer',
    --       ['ia'] = '@parameter.inner',
    --       ['af'] = '@function.outer',
    --       ['if'] = '@function.inner',
    --       ['ac'] = '@class.outer',
    --       ['ic'] = '@class.inner',
    --     },
    --   },
    --   move = {
    --     enable = true,
    --     set_jumps = true,  -- Set jumps in the jumplist
    --     goto_next_start = {
    --       [']m'] = '@function.outer',
    --       [']]'] = '@class.outer',
    --     },
    --     goto_next_end = {
    --       [']M'] = '@function.outer',
    --       [']['] = '@class.outer',
    --     },
    --     goto_previous_start = {
    --       ['[m'] = '@function.outer',
    --       ['[['] = '@class.outer',
    --     },
    --     goto_previous_end = {
    --       ['[M'] = '@function.outer',
    --       ['[]'] = '@class.outer',
    --     },
    --   },
    --   swap = {
    --     enable = true,
    --     swap_next = {
    --       ['<leader>a'] = '@parameter.inner',
    --     },
    --     swap_previous = {
    --       ['<leader>A'] = '@parameter.inner',
    --     },
    --   },
    -- },
  }
end, 0)

