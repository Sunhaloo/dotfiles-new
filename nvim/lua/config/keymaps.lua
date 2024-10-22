-- variables
-- no need to type prefix `vim.keymap` before every keymap
local keymap = vim.keymap
-- `noremap` prevents keymaps from being overwritten
-- `silent` tells Neovim to display the command or not to display the command
	-- if set to `true` will silent the commands
	-- if set to `false` will not silent the commands
local opts = { noremap = true, silent = true }

-- leader keys ---> set to `<Space>`
-- overall / global leader key takes control over "most" files
vim.g.mapleader = ' '
-- local leader key depends on specific buffers and filetypes
-- can be used to overide 'vim.g.mapleader` / global leader key
vim.g.maplocalleader = ' '

-- <C-i> is not <C-i> by default, need to make it become <C-i>
keymap.set("n", "<C-i>", "<C-i>", opts)

-- NORMAL Mode

-- copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy TO System Clipboard" })
-- paste from system clipboard
keymap.set({"n", "v"}, "<leader>p", [["+p]], { desc = "Copy FROM System Clipboard" })

-- increment / decrement numbers

-- increment using '+' character
keymap.set("n", "+", "<C-a>", { desc = "Increment Number by 1"})
-- decrement using '-' character
keymap.set("n", "-", "<C-x>", { desc = "Decrement Number by 1"})

-- delete a word backwards
keymap.set("n", "dw", "vb_d")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All"})

-- open lex
keymap.set("n", "lx", "<cmd>Lex<Return>", { desc = "Lex" })

-- tabs

-- new tab with `te`
keymap.set("n", "te", "<cmd>tabedit<CR>", { desc = "Open New Tab" })
-- switch to next tab with `<Tab>`
keymap.set("n", "<tab>", "<cmd>tabnext<Return>", opts)
-- switch to previous tab with `Shift+<Tab>`
keymap.set("n", "<s-tab>", "<cmd>tabprev<Return>", opts)
-- save and close tab with <leader>X
keymap.set("n", "<leader>X", ":w | tabclose<CR>", { desc = "Save and Close Tab" })

-- split window ( neovim )
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window ( from neovim to neovim )
-- NOTE: currently using the vim-tmux-navigator plugin ==> makes it so much easier
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- resize windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- insert mode

-- go to normal mode from insert mode
keymap.set("i", "jk", "<ESC>", opts)

-- navigation within insert mode ( I am weird )
keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)

-- visual mode

-- paste over currently selected text without yanking it
keymap.set("v", "p", [["_dp]])
keymap.set("v", "p", [["_dP]])

-- go to normal mode from visual mode
keymap.set("v", "jk", "<ESC>", opts)

-- move lines of text ( up / down ) with visual mode
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- paste even when in visual mode
keymap.set("v", "p", '"_dP', opts)

-- stay in indent mode when tabbing / untabbing line or block of text or characters
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- lazy plugin manager
keymap.set("n", "<leader>L", ":Lazy<CR>", { desc = "Lazy Plugin Manager" })

-- neotree file browser
keymap.set("n", "<leader>e", ":Neotree toggle left<CR>", { desc = "File Explorer ( Left )" })
keymap.set("n", "<leader>E", ":Neotree toggle float<CR>", { desc = "File Explorer ( Float )" })

-- telescope
keymap.set("n", "<leader>T", "<cmd>Telescope<CR>", { desc = "Telescope" })
keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<CR>", { desc = "Change Colorscheme" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find Files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Telescope Find Git Files" })
keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live Grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Buffer" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Old Files" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Highlighted Comments" })

-- toggle zenmode
keymap.set("n", "<leader>Z", ":ZenMode<CR>", { desc = "Zen Mode" })

-- markdown preview
keymap.set("n", "<leader>Mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview Start" })
keymap.set("n", "<leader>Mps", ":MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })
