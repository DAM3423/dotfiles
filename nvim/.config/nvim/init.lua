-- Initialize packer
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- One Dark Pro theme
  use 'olimorris/onedarkpro.nvim'

  -- Telescope for file navigation (CMD + P functionality)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Optionally add other plugins here
end)

-- Enable true color support for One Dark Pro
vim.o.termguicolors = true

-- Apply the One Dark Pro theme
vim.cmd([[colorscheme onedark]])

-- Enable line numbers globally
vim.o.number = true
vim.o.relativenumber = true

-- Map Ctrl + P to Telescope's file finder using Lua function
local builtin = require('telescope.builtin')
vim.api.nvim_set_keymap('n', '<C-p>', '', { callback = builtin.find_files, noremap = true, silent = true })

