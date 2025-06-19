require("nguyenmho")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",

  { "folke/which-key.nvim", opts = {} },
  "zbirenbaum/copilot.lua",

  -- Git signs in gutter
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  "ruifm/gitlinker.nvim",

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      -- Basic configuration for nvim-ufo
      vim.o.foldlevel = 99           -- Using ufo, set high fold level
      vim.o.foldlevelstart = 99      -- Start with all folds open
      vim.o.foldenable = true        -- Enable folding

      -- Optionally, customize more settings as needed
      require("ufo").setup()
    end,
  },


  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim", main = 'ibl', opts = {} },

  -- Commenting utility
  { "numToStr/Comment.nvim", opts = {} },

  -- Context-aware commenting
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Fuzzy Finder & Treesitter
  "nvim-telescope/telescope.nvim",
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP management with Mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",  -- Required for configuring LSP servers

  -- Telescope FZF extension for faster file search
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },
  {
    -- set lualine as statusline
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  -- Null-ls for integrating external linters/formatters into Neovim’s LSP ecosystem
  "jose-elias-alvarez/null-ls.nvim",

  -- mason-null-ls integrates Mason with null-ls for external tools
  {
    "jayp0521/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "eslint_d" }, -- Mason will install eslint_d
        automatic_installation = true,
      })
    end,
  },

  "SmiteshP/nvim-navic",

  -- themes --
  "rose-pine/neovim",
  "ellisonleao/gruvbox.nvim",

  "nvim-pack/nvim-spectre",
  {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
})

-- Apply the colorscheme
vim.cmd("colorscheme gruvbox")
vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
