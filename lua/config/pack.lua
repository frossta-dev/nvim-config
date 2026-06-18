vim.pack.add({
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/tpope/vim-fugitive',
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

require("plugins.mini")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.catpuccin")
require("plugins.treesitter")
