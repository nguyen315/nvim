require("gitsigns").setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
    end

    -- Git hunk navigation and actions
    map("n", "]h", gs.next_hunk, "Next Hunk")
    map("n", "[h", gs.prev_hunk, "Prev Hunk")
    map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
    map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
    map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
    map("n", "<leader>ghd", gs.diffthis, "Diff This")
  end,
})

-- Toggle Git Blame using gitsigns
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle Git Blame" })

require("gitlinker").setup({
  -- optional configuration, see gitlinker.nvim docs
  mappings = nil, -- we'll define our own mapping
})

-- Key mapping to open the URL for the current commit (or PR link, if supported)
vim.keymap.set("n", "<leader>gl", function()
  require("gitlinker").get_buf_range_url("n", {
    action_callback = require("gitlinker.actions").open_in_browser
  })
end, { desc = "Open commit/PR URL" })
