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
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("plugin/config/gruvbox")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugin/config/lspconfig")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugin/config/nvimtree")
        end,
        module = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TDUpdate",
        config = function()
            require("plugin/config/treesitter")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugin/config/toggleterm")
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("plugin/config/rusttools")
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        config = function()
            require("plugin/config/transparent")
        end,
    },
})
