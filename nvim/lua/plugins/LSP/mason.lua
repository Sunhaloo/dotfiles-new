return {
    {
        "williamboman/mason.nvim",
        -- make it easier to install and manage LSPs
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- create a variable to import mason
            local mason = require("mason")
            -- create a variable to import mason-lspconfig
            local mason_lspconfig = require("mason-lspconfig")

            -- actually enable mason
            mason.setup({
                ui = {
                    -- configure the icons
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })
            -- configure mason-lspconfig
            mason_lspconfig.setup({
                -- list of LSPs for mason to install
                -- ensures that these are always installed
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "html",
                    "lua_ls",
                    "marksman",
                },
            })
        end,
    },
}
