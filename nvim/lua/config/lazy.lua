-- start lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- already setup in `keymap.lua`
-- `keymaps.lua` file is being loaded first
-- still keeping this for redundancy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({ { import = "plugins" }, { import = "plugins.LSP" }, { import = "plugins.markdown" } }, {

	install = {
		missing = true,
		colorscheme = { "onedark" },
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "onedark" } },

	-- automatically check for plugin updates
	checker = {
		enabled = true,
		notify = false,
	},

	-- check for any changes in configuration
	change_dectection = {
		enabled = true,
		notify = false,
	},

	-- ui changes
	ui = {
		border = "rounded",
	},
})
