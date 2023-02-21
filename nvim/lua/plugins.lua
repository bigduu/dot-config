local packer = require("packer")
packer.startup({
    function()
      -- Packer can manage itself
      use("wbthomason/packer.nvim")
      -- git tools
      use("APZelos/blamer.nvim")
      use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
      use("yamatsum/nvim-cursorline")
      -- lualine
      use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
      use("arkav/lualine-lsp-progress")
      use("udalov/kotlin-vim")
      -- front endpoint
      use("b0o/schemastore.nvim")
      use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
      use("windwp/nvim-ts-autotag")
      -- treesitter
      use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
      --nord theme
      use("sainnhe/gruvbox-material")
      use("folke/tokyonight.nvim")
      use("projekt0n/github-nvim-theme")
      use("p00f/nvim-ts-rainbow")
      use("onsails/lspkind-nvim")
      use({
          "bigduu/lspsaga.nvim",
          branch = "fix-code-action-not-execute-selected-line",
      })
      -- outline
      use("simrat39/symbols-outline.nvim")
      -- color
      use("NvChad/nvim-colorizer.lua")
      -- nvim-tree
      use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
      use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
      use("kazhala/close-buffers.nvim")
      -- lsp
      use({ "williamboman/mason.nvim" })
      use({ "williamboman/mason-lspconfig.nvim" })
      use({ "neovim/nvim-lspconfig" })
      use("mfussenegger/nvim-jdtls")
      -- cmp
      use("hrsh7th/nvim-cmp")
      use("dcampos/cmp-snippy")
      use("hrsh7th/cmp-nvim-lsp")
      use("hrsh7th/cmp-nvim-lsp-signature-help")
      use("hrsh7th/cmp-nvim-lua")
      use("hrsh7th/cmp-buffer")
      use("hrsh7th/cmp-path")
      use("hrsh7th/cmp-cmdline")
      use("f3fora/cmp-spell")
      use("octaltree/cmp-look")
      --For vsnip users.
      use("hrsh7th/cmp-vsnip")
      -- Lua 增强
      use("folke/neodev.nvim")

      --snip
      use("hrsh7th/vim-vsnip")
      use("dcampos/nvim-snippy")
      use("SirVer/ultisnips")
      use("quangnguyen30192/cmp-nvim-ultisnips")
      use("rafamadriz/friendly-snippets")

      -- formatting
      use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
      -- telescope
      use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
      use({ "LinArcX/telescope-command-palette.nvim" })
      use("ahmedkhalf/project.nvim")

      use("windwp/nvim-autopairs")
      use({ "VonHeikemen/fine-cmdline.nvim", requires = { { "MunifTanjim/nui.nvim" } } })
      -- debugging
      use("mfussenegger/nvim-dap")
      use("theHamsta/nvim-dap-virtual-text")
      use("rcarriga/nvim-dap-ui")
      use("nvim-lua/plenary.nvim")
      use("puremourning/vimspector")
      use("mattn/webapi-vim")
      -- code translator
      use("voldikss/vim-translator")
      -- gcc for comment code / code block
      use({
          "numToStr/Comment.nvim",
          config = function()
            require("Comment").setup()
          end,
      })
      use({ "phaazon/hop.nvim" })
      -- pupup window for code action
      use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
      use("simrat39/rust-tools.nvim")
      use("rust-lang/rust.vim")
      -- rust crates
      use({
          "saecki/crates.nvim",
          tag = "v0.3.0",
          requires = { "nvim-lua/plenary.nvim" },
          config = function()
            require("crates").setup()
          end,
      })
      -- tabnine code completed
      use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
      use("github/copilot.vim")
      use({
          "iamcco/markdown-preview.nvim",
          run = function()
            vim.fn["mkdp#util#install"]()
          end,
      })
      -- surround
      use("ur4ltz/surround.nvim")
      -- indent-blankline
      use("lukas-reineke/indent-blankline.nvim")
      -- git
      use({ "lewis6991/gitsigns.nvim" })
      -- command line
      use({
          "VonHeikemen/fine-cmdline.nvim",
          requires = {
              { "MunifTanjim/nui.nvim" },
          },
      })
    end,
    config = {
        max_jobs = 15,
        display = {
            open_fn = function()
              return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
-- auto install plugin
-- pcall(
-- ---@diagnostic disable-next-line: param-type-mismatch
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
