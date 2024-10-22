print("Sourced Init File")

-- in short the **order** or loading the configuration files are important
-- load keymaps file
require("config.keymaps")
-- load options file
require("config.options")
-- load lazy file
require("config.lazy")
-- configure the theme
vim.cmd.colorscheme("onedark")
-- load auto-commands file
require("config.autocmd")
