return { -- override blink.cmp plugin
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = { preselect = true, auto_insert = false },
      },
    },
    fuzzy = { implementation = "rust" },
  },
}