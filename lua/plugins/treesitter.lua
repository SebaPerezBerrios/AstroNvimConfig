-- Customize Treesitter

---@type LazySpec
return {{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          node_decremental = "<C-m>",
        },
      }
  },
},
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
}
