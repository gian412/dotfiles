-- Load and setup nvim-treesitter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "html", "python"},
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})
