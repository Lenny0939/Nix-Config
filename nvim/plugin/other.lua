require("ibl").setup()
require "ibl".overwrite {
	exclude = { filetypes = { "dashboard" } }
}
require("tokyonight").setup({
	style = "moon",
	transparent = true
})
vim.cmd("colorscheme tokyonight")
