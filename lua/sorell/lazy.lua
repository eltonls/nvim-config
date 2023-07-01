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

require("lazy").setup({
  "folke/which-key.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/typescript.nvim",
  "neovim/nvim-lspconfig",
  "ray-x/lsp_signature.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "lukas-reineke/cmp-under-comparator",
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
  { "Everblush/nvim", name = "everblush" },
  "ray-x/aurora",
  "projekt0n/circles.nvim",
  "xiyaowong/transparent.nvim",
  "saadparwaiz1/cmp_luasnip",
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "onsails/diaglist.nvim",
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {}
  },
  "ThePrimeagen/harpoon",
  "kevinhwang91/nvim-hlslens",
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "tpope/vim-fugitive",
  { "CRAG666/code_runner.nvim", config = true },
  "lukas-reineke/indent-blankline.nvim",
  "booperlv/nvim-gomove",
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "gen740/SmoothCursor.nvim",
  {"glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    {"nvim-tree/nvim-web-devicons"},
    --Please make sure you install markdown and markdown_inline parser
    {"nvim-treesitter/nvim-treesitter"}
  }},
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  { "Dhanus3133/LeetBuddy.nvim"}
})
