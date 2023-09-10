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
    -- Themes
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    { "rebelot/kanagawa.nvim", priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    -- TreeSitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    -- LSP server
    {"neovim/nvim-lspconfig"},

    -- cmp autocomplite
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip'},

    -- LSP linter 
    {'mfussenegger/nvim-lint'},

    --Telescope
    {'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

    --AutoSave
    {'pocco81/auto-save.nvim'},

    -- Autopairs
    {'windwp/nvim-autopairs'},

    --Buffer line
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    --UndoTree
    {'mbbill/undotree'},

    -- Git
    {'tpope/vim-fugitive'},

    --NeoTest
    { 
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    },

    -- NeoTest Python
    {'nvim-neotest/neotest-python'},

    -- Nvim Dap 
    {'mfussenegger/nvim-dap'},

    -- Nvim Dap python 
    {'mfussenegger/nvim-dap-python'},
})
