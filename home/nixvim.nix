{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    #colorschemes.base16-catppuccin-mocha.enable = true;
		#colorschemes.base16.enable = true;
		colorschemes.catppuccin = {
		  enable = true;
			transparentBackground = true;
		};
		globals.mapleader = " ";
		options = {
			clipboard = "unnamedplus";
			cursorline = true;
			number = true;
			relativenumber = true;
			signcolumn = "number";
			tabstop = 2;
			shiftwidth = 2;
			updatetime = 300;
			termguicolors = true;
			mouse = "a";
		};
    plugins = {
			/* Rust */
				#rustaceanvim.enable = true;
			/* Telescope */
				telescope.enable = true;
			/* UI */
				oil.enable = true;
				lualine.enable = true;
				notify = {
					enable = true;
					backgroundColour = "#000000";
				};
				noice.enable = true;
			/* CMP/snippets */
				cmp_luasnip.enable = true;
				luasnip = {
				  enable = true;
					fromVscode = [{}];
				};
				nvim-cmp = {
					enable = true;
					autoEnableSources = true;
					sources = [
						{name = "nvim_lsp";}
						{name = "luasnip";}
						{name = "path";}
						{name = "buffer";}
					];
					mapping = {
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<Tab>" = {
							action = /* lua */ ''
								function(fallback)
									if cmp.visible() then
										cmp.select_next_item()
									elseif require('luasnip').expandable() then
										require('luasnip').expand()
									elseif require('luasnip').expand_or_jumpable() then
										require('luasnip').expand_or_jump()
									--elseif check_backspace() then
									--	fallback()
									else
										fallback()
									end
								end
							'';
							modes = [ "i" "s" ];
						};
					};
				};
			/* LSP */
				lsp = {
					enable = true;
					servers = {
						nil_ls.enable = true;
						clangd.enable = true;
						# Rust-analyzer automatically enabled by rustaceanvim
					};
				};
			/* Makes code look nicer */
				illuminate.enable = true;
				nvim-colorizer.enable = true;
				treesitter.enable = true;
			/* Helps with learning */
				#vim-be-good.enable = true;
				which-key.enable = true;
			/* QOL */
				nvim-autopairs.enable = true;
				indent-blankline.enable = true;
				comment-nvim.enable = true;
			/* Dependencies */
				dap.enable = true;
		};
		extraPlugins = with pkgs.vimPlugins; [
		  vim-be-good
			rustaceanvim
			friendly-snippets
		];
		keymaps = [
			{
        mode = "n";
        key = "<leader>ff";
        options.silent = true;
        action = "<cmd>Telescope find_files<CR>";
      }
			{
        mode = "n";
        key = "<leader>fg";
        options.silent = true;
        action = "<cmd>Telescope git_files<CR>";
      }
			{
			  mode = "n";
				key = "<leader>pv";
				action = "<cmd>Oil<CR>";
			}
			{
        mode = "n";
        key = "<C-d>";
        options.silent = false;
				options.noremap = true;
        action = "<C-d>zz";
      }
			{
        mode = "n";
        key = "<C-u>";
        options.silent = false;
				options.noremap = true;
        action = "<C-u>zz";
      }
			{
        mode = "n";
        key = "n";
        options.silent = false;
				options.noremap = true;
        action = "nzz";
      }
			{
        mode = "n";
        key = "N";
        options.silent = false;
				options.noremap = true;
        action = "N/*  */zz";
      }
		];
  };
}