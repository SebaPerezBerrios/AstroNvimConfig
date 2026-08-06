-- return {}
return {
  "milanglacier/minuet-ai.nvim",
  lazy = false,
  config = function()
    require("minuet").setup {
      provider = "openai_fim_compatible",
      context_window = 16384,
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:7b-instruct-q8_0",
        },
      },

      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          -- accept whole completion
          accept = "<A-a>",
          -- accept one line
          accept_line = "<A-i>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<A-z>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-n>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-m>",
          dismiss = "<A-e>",
        },
      },
    }
  end,
}
