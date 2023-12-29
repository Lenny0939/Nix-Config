require("ibl").setup()
require "ibl".overwrite {
	exclude = { filetypes = { "dashboard" } }
}
require("tokyonight").setup({
	bold_keywords = true;
	reduced_blue = true;
})
--vim.g.everforest_transparent_background=1
vim.cmd("colorscheme nordic")
