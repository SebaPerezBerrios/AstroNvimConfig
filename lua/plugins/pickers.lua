return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      picker = {
        win = {
          list = {
            keys = {
              ["a"] = "focus_input",
            },
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.mappings.n.gi = {
        function()
          require("snacks.picker").lsp_implementations {
            focus = "list",
            include_current = true,
          }
        end,
        desc = "LSP Implementations",
        cond = "textDocument/implementation",
      }

      opts.mappings.n.gs = {
        function() require("snacks.picker").lsp_symbols {} end,
        desc = "LSP Document Symbols",
      }

      opts.mappings.n.gS = {
        function() require("snacks.picker").lsp_workspace_symbols {} end,
        desc = "LSP Workspace Symbols",
      }

      if opts.mappings.n.gd then
        opts.mappings.n.gd[1] = function()
          require("snacks.picker").lsp_definitions {
            focus = "list",
            include_current = true,
          }
        end
      end

      opts.mappings.n.gD = {
        function()
          require("snacks.picker").lsp_declarations {
            focus = "list",
          }
        end,
        desc = "LSP Declarations",
        cond = "textDocument/declarations",
      }

      if opts.mappings.n.gI then
        opts.mappings.n.gi = opts.mappings.n.gI
        opts.mappings.n.gi[1] = function()
          require("snacks.picker").lsp_implementations {
            focus = "list",
            include_current = true,
          }
        end
        opts.mappings.n.gI = nil
      end

      if opts.mappings.n.gy then
        opts.mappings.n.gy[1] = function()
          require("snacks.picker").lsp_type_definitions {
            focus = "list",
            include_current = true,
          }
        end
      end

      if opts.mappings.n["<Leader>lR"] then
        opts.mappings.n.gf = opts.mappings.n["<Leader>lR"]
        opts.mappings.n.gf[1] = function()
          require("snacks.picker").lsp_references {
            focus = "list",
            include_current = true,
          }
        end
        opts.mappings.n["<Leader>lR"] = nil
      end
    end,
  },
}
