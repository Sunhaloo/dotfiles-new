return {
  {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = function()
          require("toggleterm").setup({
              size = 15,
              open_mapping = [[<c-/>]],
              hide_numbers = true,
              direction = "float",
              close_on_exit = true,
              float_opts = {
                  border = "curved",
              },
          })
      end,
  }
}

