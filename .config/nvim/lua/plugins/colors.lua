function ColorMyPencils(color, transparent)
  color = color or "gruber-darker"
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
    "blazkowolf/gruber-darker.nvim",
    config = function()
      require("gruber-darker").setup({})
      ColorMyPencils()
    end,
  },
}
