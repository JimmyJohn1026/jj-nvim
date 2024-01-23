local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "rust", "lua", "c" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = false },
})
