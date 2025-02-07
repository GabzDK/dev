return {

    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
            require("mini.cursorword").setup({})
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    position = "right", -- Set position to "right" instead of "left"
                },
                -- other configurations as needed
            })
        end,
    },
}
