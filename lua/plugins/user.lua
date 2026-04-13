-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "gbprod/substitute.nvim",
    lazy = false,
    config = function() require("substitute").setup() end,
  },

  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    opts = {
      skipInsignificantPunctuation = false,
    },
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function() require("nvim-surround").setup {} end,
  },

  {
    "smoka7/hop.nvim",
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
    "cbochs/portal.nvim",
    dependencies = {
      "cbochs/grapple.nvim",
      "ThePrimeagen/harpoon",
    },
  },
}
