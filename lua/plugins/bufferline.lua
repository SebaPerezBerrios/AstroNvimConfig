return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    -- { import = "astrocommunity.recipes.disable-tabline" }, -- dependency before loading rest of the spec
  },
  config = function()
    local bufferline = require "bufferline"
    local errorIcon = require("astroui").get_icon "DiagnosticError"

    bufferline.setup {
      highlights = {
        error = {
          fg = "#CC241D",
        },
      },
      options = {
        mode = "buffers",
        separator_style = "slope",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 0,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          if level:match "error" then return " " .. errorIcon .. " " .. count end
          return ""
        end,
        offsets = {
          {
            -- filetype = "NvimTree",
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    }
  end,
}
