-- Built-in Ex command name -> short description, read once from the
-- Ex command table in Neovim's help (`:help ex-cmd-index`)
local cached_descriptions
local function builtin_command_descriptions()
  if not cached_descriptions then
    cached_descriptions = {}
    local last_name
    for line in io.lines(vim.env.VIMRUNTIME .. "/doc/index.txt") do
      local name, description = line:match("^|:([^|]+)|%s+%S+%s+(.+)$")
      local continued = line:match("^\t\t\t\t(%S.*)$")
      if name then
        cached_descriptions[name] = description
        last_name = name
      elseif continued and last_name then
        -- Description wrapped onto the next line
        cached_descriptions[last_name] = cached_descriptions[last_name] .. " " .. continued
      else
        last_name = nil
      end
    end
  end
  return cached_descriptions
end

return {
  -- Disable inlay hints in LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  -- Surround: gsa (add), gsd (delete), gsr (replace)
  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  -- No automatic completion in markdown; <C-space> still shows the menu
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          auto_show = function()
            return vim.bo.filetype ~= "markdown"
          end,
          -- Room for full command descriptions in `:` mode (longest is 63)
          draw = {
            components = {
              label_description = {
                width = {
                  max = function(ctx)
                    return ctx.mode == "cmdline" and 80 or 30
                  end,
                },
              },
            },
          },
        },
        ghost_text = {
          enabled = function()
            return vim.bo.filetype ~= "markdown"
          end,
        },
      },
      -- In `:` mode, while typing the command name: list first the command the
      -- typed short form really runs (`:w` -> write, not wall; `:q` -> quit;
      -- `:e` -> edit), and show each built-in command's description
      sources = {
        providers = {
          cmdline = {
            transform_items = function(ctx, items)
              if vim.fn.getcmdtype() ~= ":" then
                return items
              end
              local word = ctx.line:sub(1, ctx.cursor[2]):match("^%s*(%a+)$")
              if not word then
                return items
              end
              local full = vim.fn.fullcommand(word)
              local descriptions = builtin_command_descriptions()
              for _, item in ipairs(items) do
                if item.label == full then
                  item.score_offset = (item.score_offset or 0) + 100
                end
                local description = descriptions[item.label]
                if description then
                  item.labelDetails = { description = description }
                end
              end
              return items
            end,
          },
        },
      },
    },
  },

  -- Cmdline on the bottom line like plain Neovim, not a popup
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { view = "cmdline" },
    },
  },
}
