return {
    "hrsh7th/nvim-cmp",
    -- lazy load this 1 event
    -- when in Insert Mode
    event = "InsertEnter",
    dependencies = {
        -- the thing the allow to give completion in the current file
        "hrsh7th/cmp-buffer",
        -- the thing that allow completion of path in system ( like path to images, etc )
        "hrsh7th/cmp-path",
        -- add LuaSnip plugin
        {
            "L3MON4D3/LuaSnip",
            -- related to latest release or something like that
            version = "v2.*",
            -- this is optional ==> I don't know what it does
            build = "make install_jsregexp",
        },
        -- auto-completion of snips
        "saadparwaiz1/cmp_luasnip",
        -- some friendly snippets that are already available
        "rafamadriz/friendly-snippets",
        -- how the completion selection window will appear ( the appearance of it )
        "onsails/lspkind.nvim",
    },
    -- actual configuration starts here
    config = function()
        -- local variables
        -- require the 'cmp' plugin
        local cmp = require("cmp")
        -- require the 'luasnip' plugin
        local luasnip = require("luasnip")
        -- require the 'lspkind' plugin
        local lspkind = require("lspkind")

        -- load the friendly snippets into neovim completion plugin ( I guess )
        require("luasnip.loaders.from_vscode").lazy_load()

        -- configure the 'nvim-cmp'
        cmp.setup({
            completion = {
                -- sets up behaviour of completion
                -- I don't understand shit
                completeopt = "menu, menuone, preview, noselect",
            },
            -- configure how nvim-cmp interacts with snippet engine
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- keymaps for moving around in the autocompletion window
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion
            sources = {
                -- the order in which we "order" them is important
                { name = "nvim_lsp" },
                -- snippets
                { name = "luasnip" },
                -- words from current buffer
                { name = "buffer" },
                -- file system paths
                { name = "path" },
            },
            -- setup 'lspkind' for the "appearance"
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}
