-- ~/.config/nvim/after/plugin/null_ls.lua

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Diagnostics from eslint_d
    null_ls.builtins.diagnostics.eslint_d,
    -- Code actions (like auto-fix) from eslint_d
    null_ls.builtins.code_actions.eslint_d,
    -- Optionally, formatting using eslint_d
    null_ls.builtins.formatting.eslint_d,
  },
})
