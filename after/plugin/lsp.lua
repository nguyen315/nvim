-- ~/.config/nvim/after/plugin/lsp.lua

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "ruby_lsp" },
})

-- code breadcrumbs
local navic = require("nvim-navic")

navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  }
}

local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Helper function to simplify mapping
local nmap = function(keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end
  vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
end


lspconfig.ts_ls.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Enable nvim-navic for TypeScript files
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    -- LSP keymaps
    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format current buffer with LSP" })

    -- Set up auto-format on save using null-ls:
    local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          async = false,
          timeout_ms = 5000,
        })
      end,
      desc = "Format buffer on save with null-ls",
    })

    -- Disable tsserver formatting if you use another formatter.
    client.server_capabilities.documentFormattingProvider = false
  end,
}

lspconfig.ruby_lsp.setup{
  capabilities = capabilities,  -- assuming you've set up and extended your capabilities
  on_attach = function(client, bufnr)
    -- Enable nvim-navic for TypeScript files
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    -- Define a helper for buffer-local key mappings
    local nmap = function(keys, func, desc)
      if desc then desc = "LSP: " .. desc end
      vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    -- Key mappings for Ruby LSP
    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

    -- Create a buffer-local :Format command if needed
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      vim.lsp.buf.format({ async = false })
    end, { desc = "Format current buffer with LSP" })
  end,
  settings = {
    -- You can add Ruby-specific settings here if needed.
  },
}
