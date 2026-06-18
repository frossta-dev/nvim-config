local treesitter = require('nvim-treesitter')

local EnsureInstalled = {
  -- languages
  'javascript', 'typescript', 'rust',
  'cpp', 'java', 'kotlin', 'python', 'odin',
  'zsh', 'bash', 'json', 'css', 'html',

  -- extras
  'http', 'dockerfile',
}

treesitter.install(EnsureInstalled)
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local buf = args.buf
    local filetype = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(filetype)
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
