-- create a variable
local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight on yanking
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { "*.txt", "*.md", "*.tex", "*.sql", },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en_gb"
    end,
  }
)

-- set caret / cursor to "beam / bar" after exiting neovim
-- NOTE: enable if you are using beam / bar caret ( cursor )
-- vim.api.nvim_create_autocmd("VimLeave", {
--     group = group,
--     pattern = "*",
--     command = "set guicursor=a:ver25"
-- })
