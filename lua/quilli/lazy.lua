local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim" },
  -- ICONS TO RULE THEM ALL
  { "nvim-tree/nvim-web-devicons" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" }
      },
      "saadparwaiz1/cmp_luasnip"
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "debugloop/telescope-undo.nvim"
    }
  },
  {
    "williamboman/mason.nvim"
  },
  { "nvim-lualine/lualine.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "folke/neodev.nvim"
    }
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  { "simrat39/rust-tools.nvim" },
  { 'kevinhwang91/nvim-ufo',        dependencies = 'kevinhwang91/promise-async' },
  { "NvChad/nvim-colorizer.lua" },
  { 'simrat39/symbols-outline.nvim' },
  { "ThePrimeagen/harpoon" },
  { "onsails/lspkind.nvim" },
  {
    "Pocco81/true-zen.nvim",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  { 'kevinhwang91/nvim-hlslens' },
  { 'echasnovski/mini.nvim',        version = '*' },
  { 'echasnovski/mini.indentscope', version = '*' },
  { 'kosayoda/nvim-lightbulb' },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  { 'm-demare/hlargs.nvim' },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },
  {
    "xiyaowong/transparent.nvim"
  },
}

require("lazy").setup(plugins)
