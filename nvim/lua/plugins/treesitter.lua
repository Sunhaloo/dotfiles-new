return {
    "nvim-treesitter/nvim-treesitter",
    -- lazy load specifically on these 2 events
    -- when opening already existing file / a new file
    event = { "BufReadPre", "BufNewFile" },
    -- update in general
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                -- configuration languages
                "lua",
                "json",
                "toml",
                "yaml",
                "bash",
                "nix",
                "requirements",
                -- programming languages that I ( could ) write in
                "python",
                "c",
                "cpp",
                "rust",
                "java",
                "html",
                "css",
                -- note taking related
                -- NOTE: then what the hell is tree-sitter-grammars/tree-sitter-markdown?
                "markdown",
                "markdown_inline",
                "org",
                -- SQL related
                "sql",
            },
            -- syntax highlighting
            highlight = {
                -- actually enable the treesitter plugin instead of using neovim's
                enable = true,
            },
            -- enables indentation ( better indentation )
            indent = {
                enabled = true,
            },
            -- enable autotagging ( with the dependency )
            autotag = {
                enable = true,
            },
        })
    end,
}
