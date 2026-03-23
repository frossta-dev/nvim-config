return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.install({
      'rust',
      'javascript',
      'typescript',
      'zig',
      'cpp',
      'c',
      'java',
      'kotlin',
      'python',
      'lua',
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= "" then
          local success = pcall(function()
            vim.treesitter.start()
          end)
          if not success then
            return
          end
        end
      end
    })
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
}
