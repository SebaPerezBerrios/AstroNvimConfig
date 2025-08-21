return {
  "nvimdev/lspsaga.nvim",
  enable = false,
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
    -- { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}
