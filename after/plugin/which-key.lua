local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
})

wk.register({
  f = {
    name = "Telescope", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Grep files" }, -- additional options for creating the keymap
    b = { "<cmd>Telescope buffers<cr>", "Find buffers" }, 
    h = { "<cmd>Telescope help_tags<cr>", "Find help tags" }
  },
}, { prefix = "<leader>" })

wk.register({
  g = {
    name = "Lsp Saga", -- optional group name
    h = { "<cmd>Lspsaga lsp_finder<cr>", "Find symbol definition" }, -- create a binding with label
    r = { "<cmd>Lspsaga rename<cr>", "Rename all ocurrences" }, -- additional options for creating the keymap
    o = { "<cmd>Lspsaga outline<CR>", "Saga Outline" },
    p = { 
      name = "Peeks",
      d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" }
    },
    c = {
      name = "Code",
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
      i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" }
    },
    s = {
      name = "Show",
      b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show buffer diagnostics" },
      w = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Show Workspace Diagnostics" },
      c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostic" }
    }
  },
}, { prefix = "<leader>" })

wk.register({
  l = {
    name = "LSP",
    D = { vim.lsp.buf.type_definition, "Type definitinion" },
    f = {  function()
      vim.lsp.buf.format { async = true }
    end, "Format code"},
    g = {
      name = "GoTo",
      D = { vim.lsp.buf.declaration, "Go to declaration" },
      d = { vim.lsp.buf.definition, "Go to definition"}
    },
    w = {
      name = "Workpaces",
      a = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
      r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
      l = { function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "List Workspaces" }
    }
  }
}, { prefix = "<leader>" })

wk.register({
  name = "Code Runner",
  c = {
    r = { "<leader>cr", "Run Code" },
    f = { "<leader>cf", "Run File" }
  }
})

vim.keymap.set('n', '<leader>cr', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>cf', ':RunFile<CR>', { noremap = true, silent = false })
