return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
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
        -- command = "hi NormalFloat guibg=#f1e4bb |" .. "hi FloatBorder guibg=#f1e4bb",
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup {
        keywordStyle = { italic = false },
        dimInactive = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "#1f1f28" },
            -- NormalFloat = { bg = "#f1ebbb" },
            -- NormalFloat = { bg = "None" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
      }
    end,
  },
}
