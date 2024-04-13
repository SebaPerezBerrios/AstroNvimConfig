return {
  {
    "glepnir/lspsaga.nvim",
    commit = "0add23a82288af0d81ddb6177496b49f3e247cfb",
    lazy = false,
    config = function()
      require("lspsaga").setup {
        ui = {
          border = "rounded",
        },
        rename = {
          quit = "<C-c>",
          exec = "<CR>",
          in_select = false,
        },
        lightbulb = {
          enable = false,
        },
      }
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
