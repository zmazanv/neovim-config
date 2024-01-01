local servers = {
  bashls = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  emmet_language_server = {},
  eslint = {},
  gopls = {},
  html = {},
  jsonls = {},
  lua_ls = {},
  marksman = {},
  nil_ls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
}

return {
  { -- LSP configuration & plugins.
    'neovim/nvim-lspconfig',
    dependencies = {
      { -- Automatically install LSPs to stdpath for Neovim.
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        opts = {},
      },
      { -- Automatically install LSPs to stdpath for Neovim.
        'williamboman/mason-lspconfig.nvim',
        config = true,
        opts = {
          ensure_installed = vim.tbl_keys(servers),
        },
      },
      { -- Useful status updates for LSP.
        'j-hui/fidget.nvim',
        config = true,
        opts = {},
      },
      { -- Additional Lua configuration for development and Neovim environment.
        'folke/neodev.nvim',
        config = true,
        opts = {},
      },
    },
    lazy = false,
    config = function()
      -- The nvim-cmp supports LSP capabilities so you should advertise it to LSP servers.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      local function setup_server(server_name)
        if lspconfig[server_name] then
          lspconfig[server_name].setup({ capabilities = capabilities })
        end
      end

      for server_name in pairs(servers) do
        setup_server(server_name)
      end

      vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

      vim.keymap.set(
        'n',
        'K',
        vim.lsp.buf.hover,
        { desc = 'Show LSP hover documentation' }
      )
      vim.keymap.set(
        'n',
        '<Leader>gd',
        vim.lsp.buf.definition,
        { desc = 'Jump to symbol definition' }
      )
      vim.keymap.set(
        'n',
        '<Leader>gr',
        vim.lsp.buf.references,
        { desc = 'Show all symbol references' }
      )
      vim.keymap.set(
        { 'n', 'v' },
        '<Leader>ca',
        vim.lsp.buf.code_action,
        { desc = 'Show code actions' }
      )
    end,
    opts = {},
  },
}
