function ColorMyPencils(color, transparent)
    color = color or "doom-one"
    transparent = transparent ~= false -- default to true
    vim.cmd.colorscheme(color)

    if transparent then
        -- Same transparent groups as before
        local transparent_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC",
            "LineNr",
            "FoldColumn",
            "EndOfBuffer",
            "VertSplit",
            "StatusLine",
            "StatusLineNC",
            "Pmenu",
        }

        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
    end
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                italic = true,
                transparency = true,
            },
        },
    },
    {
        "NTBBloodbath/doom-one.nvim",
        config = function()
            ColorMyPencils()
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            ColorMyPencils()
        end,
    },
    {
        'NTBBloodbath/doom-one.nvim',
        setup = function()
            -- Add color to cursor
            vim.g.doom_one_cursor_coloring = false
            -- Set :terminal colors
            vim.g.doom_one_terminal_colors = true
            -- Enable italic comments
            vim.g.doom_one_italic_comments = false
            -- Enable TS support
            vim.g.doom_one_enable_treesitter = true
            -- Color whole diagnostic text or only underline
            vim.g.doom_one_diagnostics_text_color = false
            -- Enable transparent background
            vim.g.doom_one_transparent_background = false

            -- Pumblend transparency
            vim.g.doom_one_pumblend_enable = false
            vim.g.doom_one_pumblend_transparency = 20

            -- Plugins integration
            vim.g.doom_one_plugin_neorg = true
            vim.g.doom_one_plugin_barbar = false
            vim.g.doom_one_plugin_telescope = false
            vim.g.doom_one_plugin_neogit = true
            vim.g.doom_one_plugin_nvim_tree = true
            vim.g.doom_one_plugin_dashboard = true
            vim.g.doom_one_plugin_startify = true
            vim.g.doom_one_plugin_whichkey = true
            vim.g.doom_one_plugin_indent_blankline = true
            vim.g.doom_one_plugin_vim_illuminate = true
            vim.g.doom_one_plugin_lspsaga = false
        end,
        config = function()
            ColorMyPencils()
        end,
    }
}

