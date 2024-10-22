-- create a variable to shorthand `vim.opt`
-- opt ---> vim.opt
local opt = vim.opt

-- follow Chris@ChrisMachine's "nvim" `options.lua' file

-- System

opt.backup = false -- Does NOT create backup file
opt.clipboard = "unnamedplus" -- Allows Neovim to use system clipboard
opt.fileencoding = "utf-8" -- Sets the encoding of the file

-- opt.ignorecase = false -- Search results needs to be case sensitive
opt.ignorecase = true -- Search results does NOT needs to be case sensitive
opt.smartcase = false -- Affects the behaviour of searching and pattern ( related to case sensitive stuff )
opt.smartindent = true -- Automatically adjust the indentation of the line
opt.swapfile = false -- Does NOT create a swap file
opt.timeoutlen = 1000 -- Time to wait for a mapped sequence to complete ( in ms - related to keymaps )
opt.undofile = true -- Allows for persistent undo
opt.updatetime = 100 -- Faster completion ( Default Value = 4000ms )
opt.writebackup = false -- Does NOT allow for file to be edited by another program / neovim ( from what I understand )
opt.expandtab = true -- Converts `Tab` to `Space`

-- opt.shiftwidth = 2 -- Number of spaces inserted for each indentation
opt.shiftwidth = 4 -- Number of spaces inserted for each indentation
-- opt.tabstop = 2 -- Insert 2 spaces for a `Tab`
opt.tabstop = 4 -- Insert 4 spaces for a `Tab`

-- Split Windows / Panes ( " -")

opt.splitbelow = true -- Force all horizontal splits to go below current window )
opt.splitright = true -- Force all vertical splits to go to the right of current windows

-- Appearance

opt.belloff = "all" -- WTF man a bell!!!
opt.cmdheight = 0 -- Space for Neovim Command Line ( in this case NO space )
opt.conceallevel = 0 -- Will show `` in markdown files
opt.hlsearch = false -- Stops higlighting the search after you leave the search
opt.pumheight = 10 -- The pop up menu height ( idk need to play with the number )
opt.pumblend = 0 -- Transparency for pop up menus
-- opt.showmode = true -- Shows "NORMAL", "INSERT", "VISUAL" modes in cmd line ( needs to put `opt.cmdheight` to anyvalue expect '0' )
opt.showmode = false -- Does NOT show "NORMAL", "INSERT", "VISUAL" modes in cmd line
opt.showtabline = 1 -- Always show tabs ( instead of buffers - like in Lazy Vim )
opt.termguicolors = true -- Allows for more colours ( 24 bits ---> Themes can be used )
opt.cursorline = true -- Highlights the current line
opt.ruler = true -- Displays information such as current line number, column number, and other status information ( to see difference check neovim status line )
opt.showcmd = true -- Display incomplete command in status line ( useful for providing visual feedback )
opt.number = true -- Adds number line
opt.relativenumber = true -- Line numbers will be relative
opt.signcolumn = "yes" -- Shows errors and other information next to the line numbers
opt.scrolloff = 0 -- Controls the minimum number of screen lines to keep above and below the cursor when scrolling
opt.sidescrolloff = 8 -- Controls the minimum number of columns to keep to the left and right of the cursor when scrolling horizontally
opt.title = true -- Shows the title in the Terminal Tab ( look up )
opt.titlelen = 0 -- Do NOT shorten the Title length
opt.guifont = "JetBrainsMono Nerd Font" -- Sets the font for ther GUI version of Neovim
opt.shortmess:append("I") -- Disables Intro / Start Message
-- opt.shortmess:append("c") -- Enables Intro / Start Message

vim.g.netrw_banner = 0 -- Disable message in "Lex" / netrw
vim.g.netrw_mouse = 2 -- Allows for mouse usage in "Lex" / netrw
