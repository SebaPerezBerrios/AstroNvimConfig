return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_dim_inactive_windows = "1"
      local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = grpid,
        pattern = "gruvbox-material",
        -- floating popups
        command = "hi NormalFloat guibg=#282828 |" .. "hi FloatBorder guibg=#282828",
        -- command = "hi NormalFloat guibg=#FBF1C7 |" .. "hi FloatBorder guibg=#FBF1C7",
        -- command = "hi NormalFloat guibg=#f1e4bb |" .. "hi FloatBorder guibg=#f1e4bb",
        -- command = "hi NormalFloat guibg=#f9f5d7 |" .. "hi FloatBorder guibg=#f9f5d7",
      })
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
