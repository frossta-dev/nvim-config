-- mini files --
local MiniFiles = require("mini.files")
MiniFiles.setup({
  mappings = {
    go_in = "L",
    go_in_plus = "<CR>",
    go_out = "H",
    go_out_plus = "_",
  }
})

vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Toggle mini file explorer' })
vim.keymap.set('n', '<leader>-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end, { desc = 'Toggle into currently opened file' })

-- mini notify --
local MiniNotify = require("mini.notify")
MiniNotify.setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  }
})

-- mini command line completions --
require("mini.cmdline").setup({
  autocorrect = { enable = false }
})

-- mini surround --
require("mini.surround").setup({
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding
    -- 'l' / 'n' as suffix for prev/next
  }
})

-- mini picker
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set('n', '<leader>pf', function() MiniPick.builtin.files() end, { desc = 'Mini File Picker' })
vim.keymap.set('n', '<leader>ps', function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>")}) end, { desc = 'Mini File Search' })
vim.keymap.set('n', '<leader>vh', function() MiniPick.builtin.help() end, { desc = 'Mini Help' })

vim.keymap.set('n', '<leader>xx', function() MiniExtra.pickers.diagnostic() end, { desc = 'Mini Picker Diagnostics' })
vim.keymap.set('n', '<leader>vh', function() MiniExtra.pickers.keymaps() end, { desc = 'Search Keymaps' })

-- mini completions --
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
  lsp_completion = {
    auto_setup = true,
    process_items = function(items, base)
      return MiniCompletion.default_process_items(items, base, {
        filtersort = 'fuzzy',
      })
    end
  }
})

-- mini snippets --
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets automatically
  },
  expand = {
    insert = function(snippet)
      MiniSnippets.default_insert(snippet, { empty_tabstop = '' })
    end,
  },
})
MiniSnippets.start_lsp_server({ match = false })

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'MiniSnippetsCurrent', {})
    vim.api.nvim_set_hl(0, 'MiniSnippetsCurrentReplace', {})
    vim.api.nvim_set_hl(0, 'MiniSnippetsFinal', {})
    vim.api.nvim_set_hl(0, 'MiniSnippetsUnvisited', {})
    vim.api.nvim_set_hl(0, 'MiniSnippetsVisited', {})
  end,
})

-- mini diff --
local MiniDiff = require("mini.diff")
MiniDiff.setup({
  source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set('n', '<leader>gg', "<cmd>tabnew | Git | only<cr>", { desc = 'fugitive full page new tab' })
vim.keymap.set('n', '<leader>gd', "<cmd>Gvdiffsplit<cr>", { desc = 'git diff split' })

-- mini pairs --
require("mini.pairs").setup()
