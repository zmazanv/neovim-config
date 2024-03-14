return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = false,
        event_handlers = {
          {
            event = 'neo_tree_popup_input_ready',
            -- @param input NuiInput
            handler = function(input)
              -- enter input popup with normal mode by default
              vim.cmd('stopinsert')
            end,
          },
        },
      })

      local function toggle()
        vim.cmd('Neotree toggle')
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end

      vim.keymap.set('n', '<C-n>', toggle, { desc = 'Toggle Neotree' })
    end,
  },
}
