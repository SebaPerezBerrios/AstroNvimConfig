return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_dim_inactive_windows = "1"
      vim.g.gruvbox_material_float_style = "blend"
      vim.g.gruvbox_material_statusline_style = "default"
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup {
        keywordStyle = { italic = false },
        dimInactive = true,
      }
    end,
  },
}