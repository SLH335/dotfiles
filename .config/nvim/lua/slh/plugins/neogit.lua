return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local neogit = require 'neogit'

    local set = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = desc, silent = true, noremap = true })
    end

    set('n', '<leader>gs', neogit.open, 'Neo[G]it [S]tatus')

    set('n', '<leader>gc', ':Neogit commit<CR>', 'Neo[G]it [C]ommit')

    set('n', '<leader>gp', ':Neogit pull<CR>', 'Neo[G]it [p]ull')

    set('n', '<leader>gP', ':Neogit push<CR>', 'Neo[G]it [P]ush')

    neogit.setup {}
  end,
}
