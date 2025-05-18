return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },
}
