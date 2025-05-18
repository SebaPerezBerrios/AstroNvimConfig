local conditions = require "heirline.conditions"
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- add new user interface icon
      icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = "",
      },
      -- modify variables used by heirline but not defined in the setup call directly
      status = {
        -- define the separators between each section
        separators = {
          left = { "", "" }, -- separator for the left side of the statusline
          right = { "", "" }, -- separator for the right side of the statusline
          tab = { "", "" },
          dash = { "", "" },
        },
        -- add new colors that can be used by heirline
        colors = function(hl)
          local get_hlgroup = require("astroui").get_hlgroup
          -- use helper function to get highlight group properties
          local comment_fg = get_hlgroup("Comment").fg
          hl.git_branch_fg = comment_fg
          hl.git_added = comment_fg
          hl.git_changed = comment_fg
          hl.git_removed = comment_fg
          hl.blank_bg = get_hlgroup("Folded").fg
          hl.file_info_bg = get_hlgroup("Visual").bg
          hl.nav_fg = get_hlgroup("Folded").bg
          hl.nav_bg = get_hlgroup("Folded").fg
          hl.lsp_bg = get_hlgroup("Visual").bg
          hl.folder_icon_bg = get_hlgroup("Error").fg
          return hl
        end,
        attributes = {
          mode = { bold = true },
          nav = { bold = true },
        },
        icon_highlights = {
          file_icon = {
            statusline = false,
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = {
            -- icon = { kind = "VimIcon", padding = { right = 1, left = 1 } },
            padding = { right = 1, left = 1 },
          },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = function() return { main = status.hl.mode_bg(), right = "blank_bg" } end,
          },
        },
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = {
            separator = "left",
            color = { main = "blank_bg", right = "file_info_bg" },
          },
        },

        -- add a section for the currently opened file information
        status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          -- filename = { fallback = "Empty" },
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
          -- disable some of the info
          filetype = false,
          file_read_only = false,
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        status.component.git_branch {
          git_branch = { padding = { left = 1 } },
          surround = { separator = "none" },
        },

        -- add a component for the current diagnostics if it exists and use the right separator for the section
        status.component.diagnostics { surround = { separator = "right" } },

        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        status.component.fill(),
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        -- status.component.fill(),
        -- add a component to display LSP clients
        status.component.lsp {
          surround = { separator = "right", color = { main = "file_info_bg" } },
          padding = { right = 1 },
        },
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = {
            separator = "right",
            color = { main = "blank_bg", left = "file_info_bg", right = "nav_bg" },
          },
        },
        status.component.nav {
          -- add some padding for the percentage provider
          percentage = false,
          -- disable all other providers
          -- ruler = false,
          -- scrollbar = false,
          -- use no separator and define the background color
          surround = { separator = "none" },
        },
      }

      opts.tabline = nil

      return opts
    end,
  },
}
