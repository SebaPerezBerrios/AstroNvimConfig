return {
  {
    "AstroNvim/astrocore",

    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      -- -- Normal --
      -- -- Standard Operations
      opts.mappings.n["<Leader>w"] = { "<cmd>w<cr>", desc = "Save" }
      opts.mappings.n["<Leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
      opts.mappings.n["<Leader>Q"] = { "<cmd>qa<cr>", desc = "Quit all windows" }
      opts.mappings.n["<Leader>nf"] = { "<cmd>enew<cr>", desc = "New File" }
      opts.mappings.n["xv"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
      opts.mappings.n["xs"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

      -- Manage Buffers
      opts.mappings.n["B"] = opts.mappings.n["<Leader>c"]
      opts.mappings.n["<Leader>c"] = false

      opts.mappings.n["<Leader>B"] = opts.mappings.n["<Leader>C"]
      opts.mappings.n["<Leader>C"] = false

      opts.mappings.n["K"] = {
        "<cmd>BufferLineCycleNext<cr>",
        desc = "Next buffer",
      }
      opts.mappings.n["J"] = {
        "<cmd>BufferLineCyclePrev<cr>",
        desc = "Previous buffer",
      }

      -- NeoTree
      opts.mappings.n["<Leader>nt"] = { "<cmd>Neotree filesystem<cr>", desc = "Toggle Explorer" }
      opts.mappings.n["<Leader>nm"] = {
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd "p"
          else
            vim.cmd.Neotree "focus"
          end
        end,
        desc = "Toggle Explorer Focus",
      }

      -- Pickers
      opts.mappings.n["<Leader>o"] = opts.mappings.n["<Leader>ff"]
      opts.mappings.n["<Leader>O"] = opts.mappings.n["<Leader>fF"]
      opts.mappings.n["<Leader>Km"] = {
        function() require("snacks.picker").keymaps() end,
        desc = "Find keymaps",
      }
      opts.mappings.n["<Leader>/"] = {
        function() require("snacks.picker").lines {} end,
        desc = "Find on current buffer",
      }
      opts.mappings.n["<Leader>ld"] = {
        function()
          require("snacks.picker").diagnostics {
            focus = "list",
            severity = vim.diagnostic.severity.ERROR,
          }
        end,
        desc = "Search diagnostics",
      }
      opts.mappings.n["<Leader>m"] = {
        function()
          require("snacks.picker").resume {
            focus = "list",
          }
        end,
        desc = "Resume last picker",
      }

      -- Terminal
      opts.mappings.t["<C-x>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" }

      -- Replace
      opts.mappings.n["gr"] = {
        function() require("substitute").operator() end,
        desc = "Replace motion",
      }
      opts.mappings.n["grr"] = {
        function() require("substitute").line() end,
        desc = "Replace line",
      }
      opts.mappings.v["gr"] = {
        function() require("substitute").visual() end,
        desc = "Replace selection",
      }

      opts.mappings.n["w"] = { "<Plug>CamelCaseMotion_w", desc = "w" }
      opts.mappings.n["b"] = { "<Plug>CamelCaseMotion_b", desc = "b" }
      opts.mappings.n["e"] = { "<Plug>CamelCaseMotion_e", desc = "e" }
      opts.mappings.n["ge"] = { "<Plug>CamelCaseMotion_ge", desc = "ge" }
      opts.mappings.v["w"] = { "<Plug>CamelCaseMotion_w", desc = "w" }
      opts.mappings.v["b"] = { "<Plug>CamelCaseMotion_b", desc = "b" }
      opts.mappings.v["e"] = { "<Plug>CamelCaseMotion_e", desc = "e" }
      opts.mappings.v["ge"] = { "<Plug>CamelCaseMotion_ge", desc = "ge" }

      opts.mappings.n["<Leader>s"] = { "<cmd>HopChar2<CR>", desc = "Search 2 chars" }
      opts.mappings.n["<Leader>j"] = { "<cmd>HopLineAC<CR>", desc = "Jump down" }
      opts.mappings.n["<Leader>k"] = { "<cmd>HopLineBC<CR>", desc = "Jump up" }
      opts.mappings.n["f"] = { "<cmd>HopWordCurrentLine<CR>", desc = "Jump current line" }
      -- opts.mappings.n["f"] = { "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>", desc = "Search char on line" }

      -- Macro
      opts.mappings.n["q"] = { "<nop>", desc = "q" }

      -- S
      opts.mappings.n["s"] = { "<nop>", desc = "s" }
      opts.mappings.n["S"] = { "<nop>", desc = "S" }

      -- C-c
      opts.mappings.n["<C-c>"] = { "<nop>", desc = "<C-c>" }

      -- Delete
      opts.mappings.n["dj"] = { "j", desc = "j" }
      opts.mappings.n["dk"] = { "k", desc = "k" }

      opts.mappings.n["<Leader>f"] = opts.mappings.n["<Leader>fw"]
      opts.mappings.n["<Leader>F"] = opts.mappings.n["<Leader>fW"]
      opts.mappings.n["<Leader>b"] = opts.mappings.n["<Leader>fb"]

      opts.mappings.n["<Leader>b"] = {
        function()
          require("snacks.picker").buffers {
            hidden = false,
            win = {
              input = {
                keys = {
                  ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
                  ["B"] = { "bufdelete", mode = { "n" } },
                },
              },
            },
          }
        end,
        desc = "List buffers",
      }

      opts.mappings.n["<Leader>;"] = { "<cmd>BufferLinePick<CR>" }
      opts.mappings.n["<Leader>pt"] = opts.mappings.n["<Leader>ft"]
      opts.mappings.n["<Leader>x"] = opts.mappings.n["<Leader>f/"]
      opts.mappings.n["<Leader>c"] = opts.mappings.n["<Leader>fC"]
      opts.mappings.n["<c-f>"] = opts.mappings.n["<Leader>n"]

      opts.mappings.n["<Leader>bc"] = nil
      opts.mappings.n["<Leader>bC"] = nil
      opts.mappings.n["<Leader>bd"] = nil
      opts.mappings.n["<Leader>bl"] = nil
      opts.mappings.n["<Leader>br"] = nil
      opts.mappings.n["<Leader>bD"] = nil
      opts.mappings.n["<Leader>bs"] = nil
      opts.mappings.n["<Leader>bse"] = nil
      opts.mappings.n["<Leader>bsr"] = nil
      opts.mappings.n["<Leader>bsp"] = nil
      opts.mappings.n["<Leader>bsi"] = nil
      opts.mappings.n["<Leader>bsm"] = nil
      opts.mappings.n["<Leader>b\\"] = nil
      opts.mappings.n["<Leader>b|"] = nil
      opts.mappings.n["<Leader>bb"] = nil
      opts.mappings.n["<Leader>bp"] = nil

      opts.mappings.n["<Leader>f/"] = nil
      opts.mappings.n["<Leader>fo"] = nil
      opts.mappings.n["<Leader>ff"] = nil
      opts.mappings.n["<Leader>fF"] = nil
      opts.mappings.n["<Leader>fh"] = nil
      opts.mappings.n["<Leader>fg"] = nil
      opts.mappings.n["<Leader>km"] = nil
      opts.mappings.n["<Leader>fl"] = nil
      opts.mappings.n["<Leader>fO"] = nil
      opts.mappings.n["<Leader>fp"] = nil
      opts.mappings.n["<Leader>fs"] = nil
      opts.mappings.n["<Leader>fu"] = nil
      opts.mappings.n["<Leader>fm"] = nil
      opts.mappings.n["<Leader>fn"] = nil
      opts.mappings.n["<Leader>ft"] = nil
      opts.mappings.n["<Leader>fw"] = nil
      opts.mappings.n["<Leader>fW"] = nil
      opts.mappings.n["<Leader>fT"] = nil
      opts.mappings.n["<Leader>fc"] = nil
      opts.mappings.n["<Leader>fC"] = nil
      opts.mappings.n["<Leader>fb"] = nil
      opts.mappings.n["<Leader>fr"] = nil
      opts.mappings.n["<Leader>f'"] = nil
      opts.mappings.n["<Leader>f<CR>"] = nil
      opts.mappings.n["<Leader>fa"] = nil
      opts.mappings.n["<Leader>fk"] = nil

      opts.mappings.n["<Leader>fo"] = nil
      opts.mappings.n["<Leader>tn"] = nil
      opts.mappings.n["<Leader>tp"] = nil

      opts.mappings.n["<Leader>n"] = nil

      opts.mappings.n["<Leader>rn"] = { "<cmd>Lspsaga rename<CR>", desc = "LSP rename" }
      opts.mappings.n["<Leader>i"] = { "<cmd>Lspsaga code_action<CR>", desc = "LSP code action" }
      opts.mappings.v["<Leader>i"] = { "<cmd>Lspsaga code_action<CR>", desc = "LSP code action" }

      opts.mappings.n["gn"] = {
        function() require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR } end,
        desc = "LSP diagnostics next",
      }
      opts.mappings.n["gm"] = {
        function() require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR } end,
        desc = "LSP diagnostics prev",
      }
      opts.mappings.n["gh"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "LSP hover" }
      -- opts.mappings.n["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "LSP hover" }

      opts.mappings.n["<Leader>D"] = { "<cmd>DiffviewOpen<CR>", desc = "Diff view Open" }
      opts.mappings.n["<Leader>S"] = { "<cmd>DiffviewClose<CR>", desc = "Diff view Close" }
      opts.mappings.n["`"] = { "<Esc>" }
      opts.mappings.n["x"] = { "<Esc>" }
      opts.mappings.v["J"] = { "<Nop>" }
      opts.mappings.v["K"] = { "<Nop>" }

      opts.mappings.n["<C-o>"] = { "<cmd>Portal jumplist backward<cr>" }
      opts.mappings.n["<C-i>"] = { "<cmd>Portal jumplist forward<cr>" }

      if vim.g.neovide then
        vim.keymap.set("v", "<C-S-c>", '"+y') -- Copy
        vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
        vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
        vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
        vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli') -- Paste insert mode
        vim.keymap.set(
          { "n", "v" },
          "<C-+>",
          "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>"
        )
        vim.keymap.set(
          { "n", "v" },
          "<C-->",
          "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>"
        )
        vim.keymap.set({ "n", "v" }, "<C-0>", "<cmd>lua vim.g.neovide_scale_factor = 1<CR>")
      end

      -- Allow clipboard copy paste in neovim
      vim.api.nvim_set_keymap("", "<C-S-v>", "+p<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("!", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })

      vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
      vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
      vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
      vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
      vim.keymap.set("n", "<C-p>", require("smart-splits").move_cursor_previous)
    end,
  },
}
