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
      },
      { -- Automatically install LSPs to stdpath for Neovim.
        'williamboman/mason-lspconfig.nvim',
      },
      { -- Useful status updates for LSP.
        'j-hui/fidget.nvim',
        config = true,
        opts = {},
      },
      { -- Additional Lua configuration for development and Neovim environment.
        'folke/neodev.nvim',
      },
    },
    lazy = false,
    config = function()
      local mason = require('mason')
      local mason_lspconfig = require('mason-lspconfig')
      local neodev = require('neodev')
      local lspconfig = require('lspconfig')
      local builtin = require('telescope.builtin')

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
        nmap('<Leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
        nmap('<Leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap(
          '<Leader>ws',
          builtin.lsp_dynamic_workspace_symbols,
          '[W]orkspace [S]ymbols'
        )

        nmap('K', vim.lsp.buf.hover, 'Hover documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap(
          '<Leader>wa',
          vim.lsp.buf.add_workspace_folder,
          '[W]orkspace [A]dd Folder'
        )
        nmap(
          '<Leader>wr',
          vim.lsp.buf.remove_workspace_folder,
          '[W]orkspace [R]emove Folder'
        )
        nmap('<Leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with kSP' })
      end

      mason.setup()
      mason_lspconfig.setup()
      neodev.setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to LSP servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })

      vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

      -- vim.keymap.set(
      --   'n',
      --   'K',
      --   vim.lsp.buf.hover,
      --   { desc = 'Show LSP hover documentation' }
      -- )
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
      -- vim.keymap.set(
      --   { 'n', 'v' },
      --   '<Leader>ca',
      --   vim.lsp.buf.code_action,
      --   { desc = 'Show code actions' }
      -- )

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
      vim.keymap.set('n', '<Leader>lm', function()
        require('mason-registry').refresh(function() end)
        require('mason.ui.instance').window.open()
      end, { desc = '[L]azy [M]ason' })
    end,
    opts = {},
  },
}
