require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = {                   -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer', "NeoTreeNormal", "NeoTreeNormalNC",
  },
  extra_groups = { "Neotree", "TelescopeNormal", "TelescopeResultsNormal",
    "TelescopePromptNormal", "TelescopePreviewNormal", "TelescopeBorder",
    "TelescopePromptBorder", "TelescopeResultsBorder", "TelescopePreviewBorder" }, -- table: additional groups that should be cleared
  exclude_groups = { "Pmenu", "LineNr" },                                          -- table: groups you don't want to clear
})

require('transparent').clear_prefix('lualine')
require('transparent').clear_prefix('NeoTree')

function ColorMyPencils()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#eceff4" })
end

ColorMyPencils()
