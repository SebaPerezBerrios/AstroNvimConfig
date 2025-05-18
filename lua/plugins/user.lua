-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- == Examples of Overriding Plugins ==

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },

  {
    "gbprod/substitute.nvim",
    lazy = false,
    config = function() require("substitute").setup() end,
  },

  {
    "bkad/CamelCaseMotion",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          visual = "ys",
        },
      }
    end,
  },

  {
    "aznhe21/hop.nvim",
    lazy = false,
    config = function() require("hop").setup {} end,
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  {
    "mrjones2014/smart-splits.nvim",
    dependencies = {
      { "kwkarlwang/bufresize.nvim", lazy = false, opts = {} },
    },
    opts = function(_, opts)
      opts.at_edge = "stop"
      opts.resize_mode = {
        hooks = {
          on_leave = require("bufresize").register,
        },
      }
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
  },
}
