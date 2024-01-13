require("ibl").setup()
require "ibl".overwrite {
	exclude = { filetypes = { "dashboard" } }
}
--require("nordic").setup({
--	bold_keywords = true;
--	reduced_blue = true;
--})
require("catppuccin").setup({
	transparentBackground = true;
});
--vim.g.everforest_transparent_background=1
vim.cmd("colorscheme catppuccin")
