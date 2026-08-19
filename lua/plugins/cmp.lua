return { -- override blink.cmp plugin
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib", -- Add this required dependency for v2
  },
  opts = {
    completion = {
      list = {
        selection = { preselect = true, auto_insert = false },
      },
    },
    fuzzy = { implementation = "rust" },
  },
}
