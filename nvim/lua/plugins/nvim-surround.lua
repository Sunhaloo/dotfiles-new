return {
    {
        "kylechui/nvim-surround",
        -- lazy load on these 2 events
        -- when opening already existing file / a new file
        event = { "VeryLazy", "BufReadPre", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
}
