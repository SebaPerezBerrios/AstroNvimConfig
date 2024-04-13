local conditions = require "heirline.conditions"
return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astroui.status")
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.file_info {
          filetype = false,
          filename = {
            fallback = "Empty",
            fname = function(nr)
              local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(nr), ":.")
              if filename == "" then return "[No Name]" end
              -- now, if the filename would occupy more than 1/4th of the available
              -- space, we trim the file path to its initials
              -- See Flexible Components section below for dynamic truncation
              if not conditions.width_percent_below(#filename, 0.4) then filename = vim.fn.pathshorten(filename) end
              return filename
            end,
            modify = "h:p",
          },
          file_modified = false,
        },
        -- status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        -- status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }

      opts.tabline = nil

      return opts
    end,
  },
}
