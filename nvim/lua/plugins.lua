local packer = require('packer')
packer.startup({ function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'udalov/kotlin-vim'
  --nord theme
  use 'shaunsingh/nord.nvim'
  -- onedark
  use("ful1e5/onedark.nvim")
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    },
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    },
    use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer'
    },
    use('hrsh7th/nvim-cmp'),
    --For vsnip users.
    use('hrsh7th/cmp-vsnip'),
    use('hrsh7th/vim-vsnip'),

    --For luasnip users.
    use('L3MON4D3/LuaSnip'),
    use('saadparwaiz1/cmp_luasnip'),

    --For ultisnips users.
    use('SirVer/ultisnips'),
    use('quangnguyen30192/cmp-nvim-ultisnips'),

    --For snippy users.
    use 'dcampos/nvim-snippy',
    use 'dcampos/cmp-snippy',
    use 'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp },
    use 'hrsh7th/cmp-nvim-lua', -- { name = nvim_lua },
    use 'hrsh7th/cmp-buffer', -- { name = 'buffer' },
    use 'hrsh7th/cmp-path', -- { name = 'path' },
    use 'hrsh7th/cmp-cmdline', -- { name = 'cmdline' },
    use 'f3fora/cmp-spell', -- { name = 'spell' },
    use 'rafamadriz/friendly-snippets',
    use 'onsails/lspkind-nvim',
    use({
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
    }),
    use "lukas-reineke/lsp-format.nvim",
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } },
    use("glepnir/dashboard-nvim"),
    use("ahmedkhalf/project.nvim"),
    use("windwp/nvim-autopairs"),
    use {
      'VonHeikemen/fine-cmdline.nvim',
      requires = {
        { 'MunifTanjim/nui.nvim' }
      }
    },
    use 'rust-lang/rust.vim',
    use 'mattn/webapi-vim',
    -- code translator
    use 'voldikss/vim-translator',
    -- gcc for comment code / code block
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
    use {
      "phaazon/hop.nvim"
    },
    -- pupup window for code action
    use {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
    },
    -- rust crates
    use {
      'saecki/crates.nvim',
      tag = 'v0.3.0',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('crates').setup()
      end,
    },
    -- tabnine code completed
    use "hrsh7th/nvim-cmp", --completion
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
    use "github/copilot.vim",
  }
end,
  config = {
    max_jobs = 20,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    }
  }
}
)
-- auto install plugin
pcall(
  vim.cmd,
  [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
