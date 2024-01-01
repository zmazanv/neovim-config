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
      local builtin = require("telescope.builtin")

      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        -- NOTE: Remember that Lua is a real programming language, and as such,
        -- it is possible to define small helper and utility functions so you
        -- don't have to repeat yourself many times.
        --
        -- In this case we create a function that lets us more easily define
        -- mapping specific for LSP related items. It sets the mode, buffer,
        -- and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
        nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplenetation')
        nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplenetation')
        nmap("<Leader>D", builtin.lsp_type_definitions, 'Type [D]efinition')
        nmap("<Leader>ds", builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap("<Leader>ws", builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      end

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

      vim.keymap.set(
        'n',
        '[d',
        vim.diagnostic.goto_prev,
        { desc = 'Go to previous diagnostic message' }
      )
      vim.keymap.set(
        'n',
        ']d',
        vim.diagnostic.goto_next,
        { desc = 'Go to next diagnostic message' }
      )
      vim.keymap.set(
        'n',
        '<Leader>e',
        vim.diagnostic.open_float,
        { desc = 'Open floating diagnostic message' }
      )
      vim.keymap.set(
        'n',
        '<Leader>q',
        vim.diagnostic.setloclist,
        { desc = 'Open diagnostics list' }
      )
    end,
    opts = {},
  },
}
