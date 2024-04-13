local telescope = require "telescope.builtin"

local function remapper(object, remaps)
  for _, pair in ipairs(remaps) do
    if object[pair[1]] ~= nil then
      if pair[2] then object[pair[2]] = object[pair[1]] end
      object[pair[1]] = nil
    end
  end
end


local definitions = function()
  telescope.lsp_definitions {
    initial_mode = "normal",
    show_line = false,
  }
end

local implementations = function()
  telescope.lsp_implementations {
    initial_mode = "normal",
    show_line = false,
  }
end

local type_definitions = function()
  telescope.lsp_type_definitions {
    initial_mode = "normal",
    show_line = false,
  }
end

local references = function()
  telescope.lsp_references {
    initial_mode = "normal",
    include_current_line = true,
    show_line = false,
  }
end

local symbols = function()
  telescope.lsp_dynamic_workspace_symbols {
    initial_mode = "insert",
    show_line = false,
    fname_width = 50,
  }
end

local normal_mappings = {
  { "<Leader>ld" },
  { "[d" },
  { "]d" },
  { "<Leader>la" },
  { "K" },
  { "gI" },
  { "gr" },
  { "gT" },
  { "<Leader>lR" },
  { "<Leader>lr" },
  { "<Leader>ll", "<Leader>r" },
  { "<Leader>lL", "<Leader>R" },
  { "<Leader>lh", "<Leader>h" },
  { "<Leader>lG", "<Leader>lg" },
}
local visual_mappings = { { "<Leader>la", "<Leader>i" } }

return {
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      remapper(opts.mappings.n, normal_mappings)
      remapper(opts.mappings.v, visual_mappings)

      opts.mappings.n.gd[1] = definitions
      opts.mappings.n.gi = { implementations, desc = "Go to implementations" }
      opts.mappings.n.gy = { type_definitions, desc = "Go to type definition" }
      opts.mappings.n.gf = { references, desc = "Find references" }
      opts.mappings.n.gs = { symbols, desc = "Find symbols" }
    end
  }
}
