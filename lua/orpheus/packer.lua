-- Only required if you have packer configured as `opt`

-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        -- config = function()
        --    vim.cmd('colorscheme rose-pine')
        -- end
    })

    use({
        'sainnhe/everforest',
        as = 'everforest'
    })
    use 'folke/tokyonight.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use("tpope/vim-fugitive")

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use { 'jose-elias-alvarez/null-ls.nvim' }

    use({
        "NTBBloodbath/galaxyline.nvim",
        -- your statusline
        config = function()
            require("galaxyline.themes.eviline")
        end,
        -- some optional icons
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    use { 'windwp/nvim-ts-autotag' }
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons"
    }
    use 'onsails/lspkind.nvim'
    use 'jose-elias-alvarez/typescript.nvim'
    use 'b0o/SchemaStore.nvim'
    use 'amrbashir/nvim-docs-view'
    use 'jinzhongjia/LspUI.nvim'
    use 'xiyaowong/nvim-transparent'
    use 'NvChad/nvim-colorizer.lua'
    use({
      "aserowy/tmux.nvim",
      config = function() return require("tmux").setup() end
    })

    use {"kosayoda/nvim-lightbulb", requires = "antoinemadec/FixCursorHold.nvim"}
    use "folke/trouble"
    use "ray-x/go.nvim"

    use "mrjones2014/nvim-ts-rainbow"
  end)
