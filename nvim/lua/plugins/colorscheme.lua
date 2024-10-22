return {
    -- beloved one dark theme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            require('onedark').setup({
                -- style set to the darker variant
                style = 'darker',
                -- style = 'light',
                transparent = true,
                -- transparent = false,
                term_colors = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'bold',
                    functions = 'underline',
                    strings = 'none',
                    variables = 'none'
                },
                diagnostics = {
                    darker = true,
                    undercurl = true
                },

            })
        end,
    },
    -- one dark theme that has one light also
    -- {
    --   "olimorris/onedarkpro.nvim",
    --   priority = 1000, -- Ensure it loads first
    -- },
    -- catppussin theme ---> say it like how ThePrimeAgan says it
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                -- set the background to transparent
                transparent_background = true,
            })
        end,
    },
    -- the goat @devaslife theme
    {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      config =  function()
          require("solarized-osaka").setup({
              -- set the background to transparent
              transparent = true,
          })
       end,
    },
    -- eldritch theme
    {
      "eldritch-theme/eldritch.nvim",
      lazy = false,
      priority = 1000,
      config = function()
          require("eldritch").setup({
              terminal_colors = true,
              transparent = true,
          })
      end,
    },
    -- cyberdream theme
    {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            terminal_colors = true,
            transparent = true,
            italic_comments = true,
            borderless_telescope = true,
        })
    end,
    },
}
