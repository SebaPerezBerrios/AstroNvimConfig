return {
  "gremble0/bufferstack.nvim",
  opts = {
    -- This is usually either vim.api.nvim_buffer_is_loaded or vim.api.nvim_buffer_is_valid,
    -- alternatively you could make your own variant. It decides what classifies an open buffer
    filter_buffers_func = vim.api.nvim_buf_is_loaded,

    -- Set keybinds in normal mode for the two functions
    bprevious = "L",
    bnext = "H",
  },
}
