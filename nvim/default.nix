{ inputs, lib, pkgs, ... }:
{
	nixpkgs.overlays = [
		(final: prev: {
			vimPlugins = prev.vimPlugins // {
				own-code_runner-nvim = prev.vimUtils.buildVimPlugin {
					name = "code_runner";
					src = inputs.plugin-code_runner;
				};
			};
		})
  ];
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
  	enable = true; 	
	  extraLuaConfig = ''
	  	${builtins.readFile ./options.lua}
	  '';
	  plugins = with pkgs.vimPlugins; [
      {
				plugin = dashboard-nvim;
				config = toLuaFile ./plugin/dashboard.lua;
			}
			{
				plugin = noice-nvim;
				config = toLuaFile ./plugin/noice.lua;
			}
			{
				plugin = neoscroll-nvim;
				config = toLua "require(\'neoscroll\').setup()";
			}
			{
				plugin = nvim-scrollbar;
				config = toLua "require(\"scrollbar\").setup()";
			}
			comment-nvim
			vim-illuminate
			vim-be-good
			nui-nvim
			nvim-notify
			#Best colorschemes:
			gruvbox-nvim
			nord-nvim
			nordic-nvim
			everforest
			kanagawa-nvim
			tokyonight-nvim
      {
				plugin = tokyonight-nvim;
				config = toLuaFile ./plugin/other.lua;
			}
      {
				plugin = nvim-lspconfig;
				config = toLuaFile ./plugin/lsp.lua;
			}
			{
				plugin = indent-blankline-nvim;
				config = toLuaFile ./plugin/other.lua;
			}
			{
				plugin = nvim-autopairs;
				config = toLua "require(\"nvim-autopairs\").setup()";
			}
			{
				plugin = oil-nvim;
				config = toLua "require(\"oil\").setup()";
			}
			{
				plugin = own-code_runner-nvim;
				config = toLuaFile ./plugin/code_runner.lua;
			}
			{
				plugin = nvim-colorizer-lua;
				config = toLua "require(\"colorizer\").setup()";
			}
			which-key-nvim
			indent-blankline-nvim
			{
				plugin = lualine-nvim;
				config = toLuaFile ./plugin/lualine.lua;
			}
			{
				plugin = nvim-cmp;
				config = toLuaFile ./plugin/cmp.lua;
			}
			cmp-nvim-lsp
			#copilot-lua
			#{
			#	plugin = copilot-lua;
			#	config = toLuaFile ./plugin/copilot.lua;
			#}
			#cmp-copilot
			cmp_luasnip
			cmp-nvim-lsp
			cmp-fuzzy-path
			luasnip
			friendly-snippets
			nvim-web-devicons
			{
				plugin = telescope-nvim;
				config = toLuaFile ./plugin/telescope.lua;
			}
			telescope-fzf-native-nvim
			neodev-nvim
			{
				plugin = (nvim-treesitter.withPlugins (p: [
    			p.tree-sitter-nix
	  			p.tree-sitter-lua
	  			p.tree-sitter-bash
    			p.tree-sitter-python
	  			p.tree-sitter-c
    			p.tree-sitter-gdscript
					p.tree-sitter-markdown
					p.tree-sitter-markdown_inline
					p.tree-sitter-regex
	  		]));
				config = toLuaFile ./plugin/treesitter.lua;
			}
  	];
	};
}
