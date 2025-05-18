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
      if require("astrocore").is_available "snacks.nvim" then
        opts.mappings.n.gf = {
          function()
            require("snacks.picker").lsp_references {
              focus = "list",
              show_line = true,
            }
          end,
          desc = "LSP References",
          cond = "textDocument/references",
        }
        opts.mappings.n.gi = {
          function()
            require("snacks.picker").lsp_implementations {
              focus = "list",
              show_line = true,
            }
          end,
          desc = "LSP Implementations",
          cond = "textDocument/implementation",
        }
        opts.mappings.n.gs = {
          function()
            require("snacks.picker").lsp_symbols {
              focus = "list",
              show_line = true,
            }
          end,
          desc = "LSP Document Symbols",
        }

        if opts.mappings.n.gd then
          opts.mappings.n.gd[1] = function()
            require("snacks.picker").lsp_definitions {
              focus = "list",
              show_line = true,
            }
          end
        end
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
        if opts.mappings.n["<Leader>lG"] then
          opts.mappings.n.gs = opts.mappings.n["<Leader>lG"]
          opts.mappings.n.gs[1] = function()
            require("snacks.picker").lsp_workspace_symbols {
              focus = "list",
              include_current = true,
            }
          end
          opts.mappings.n["<Leader>lG"] = nil
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
      elseif require("astrocore").is_available "telescope.nvim" then
        if opts.mappings.n.gd then
          opts.mappings.n.gd[1] = function() require("telescope.builtin").lsp_definitions { reuse_win = true } end
        end
        if opts.mappings.n.gI then
          opts.mappings.n.gI[1] = function() require("telescope.builtin").lsp_implementations { reuse_win = true } end
        end
        if opts.mappings.n.gy then
          opts.mappings.n.gy[1] = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end
        end
        if opts.mappings.n["<Leader>lG"] then
          opts.mappings.n["<Leader>lG"][1] = function()
            vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
              if query then
                -- word under cursor if given query is empty
                if query == "" then query = vim.fn.expand "<cword>" end
                require("telescope.builtin").lsp_workspace_symbols {
                  query = query,
                  prompt_title = ("Find word (%s)"):format(query),
                }
              end
            end)
          end
        end
        if opts.mappings.n["<Leader>lR"] then
          opts.mappings.n["<Leader>lR"][1] = function() require("telescope.builtin").lsp_references() end
        end
      end
    end,
  },
}
