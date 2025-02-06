return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            groups = {
                background = "#000000", -- Override main background
                panel = "#000000", -- Background for floating windows like Telescope
                border = "#000000", -- Borders for floating windows
            },
            highlight_groups = {
                -- Telescope-specific adjustments (if required)
                TelescopeNormal = { bg = "#000000" },
                TelescopeBorder = { bg = "#000000", fg = "#000000" },
                TelescopePromptNormal = { bg = "#000000" },
                TelescopePromptBorder = { bg = "#000000", fg = "#000000" },
                TelescopeResultsNormal = { bg = "#000000" },
                TelescopeResultsBorder = { bg = "#000000", fg = "#000000" },
                TelescopePreviewNormal = { bg = "#000000" },
                TelescopePreviewBorder = { bg = "#000000", fg = "#000000" },

                -- Ensure floating windows stay consistent
                NormalFloat = { bg = "#000000" },
                FloatBorder = { bg = "#000000", fg = "#000000" },
            },
        })
    end,
}
