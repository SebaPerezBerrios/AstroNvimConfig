return {
  "MeanderingProgrammer/treesitter-modules.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ---@module 'treesitter-modules'
  ---@type ts.mod.UserConfig
  opts = {
    incremental_selection = {
      enable = true,
      disable = false,
      -- set value to `false` to disable individual mapping
      keymaps = {
        init_selection = "<c-n>",
        node_incremental = "<c-n>",
        scope_incremental = false,
        node_decremental = "<c-m>",
      },
    },
  },
}
