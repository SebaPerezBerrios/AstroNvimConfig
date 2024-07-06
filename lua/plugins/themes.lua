return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      -- vim.o.background = "light"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_dim_inactive_windows = "1"
      local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = grpid,
        pattern = "gruvbox-material",
        -- floating popups
        command = "hi NormalFloat guibg=#282828 |" .. "hi FloatBorder guibg=#282828",
        -- command = "hi NormalFloat guibg=#FBF1C7 |" .. "hi FloatBorder guibg=#FBF1C7",
      })
    end,
  },
}
