-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "vimdoc",
        -- add more arguments for adding more treesitter parsers
        "typescript",
        "javascript",
        "tsx",
        "markdown",
        "markdown_inline",
      })
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          node_decremental = "<C-m>",
        },
      }
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
}
