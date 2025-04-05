return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {

    "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable eslint for specific file patterns or completely
      servers = {
        eslint = {
          enabled = false,
        },
      },
    },
  },
}
