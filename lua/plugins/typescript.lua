return {
  "AstroNvim/astrolsp",
  opts = {
    autocmds = {
      eslint_fix_on_save = false,
    },
    formatting = {
      disabled = {
        "vtsls",
        "eslint",
      },
    },
  },
}
