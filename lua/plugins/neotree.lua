return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      -- only needed if you want to use the commands with "_with_window_picker" suffix
      "s1n7ax/nvim-window-picker",
      lazy = false,
      config = function()
        require("window-picker").setup {
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
          -- other_win_hl_color = "#e35e4f",
          selection_chars = "ABCDEFGHIJK",
        }
      end,
    },
  },
  opts = {
    window = {
      mappings = {
        ["J"] = "prev_source",
        ["K"] = "next_source",
        ["o"] = { "open_with_window_picker", nowait = true },
        ["oc"] = "noop",
        ["od"] = "noop",
        ["og"] = "noop",
        ["om"] = "noop",
        ["on"] = "noop",
        ["os"] = "noop",
        ["ot"] = "noop",
        ["<esc>"] = "close_window",
        ["s"] = "split_with_window_picker",
        ["v"] = "vsplit_with_window_picker",
        ["c"] = {
          "copy",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
        ["m"] = {
          "move",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
      },
    },
    filesystem = {
      window = {
        auto_expand_width = true,
      },
      filtered_items = { hide_gitignored = false, hide_dotfiles = false },
    },
    buffers = {
      window = {
        auto_expand_width = true,
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_) vim.opt_local.signcolumn = "auto" end,
      },
      {
        event = "file_opened",
        handler = function(file_path) vim.cmd.Neotree "close" end,
      },
    },
  },
}
