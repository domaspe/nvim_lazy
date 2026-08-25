return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          local explorer = Snacks.picker.get({ source = "explorer" })[1]
          if not explorer or explorer.closed then
            Snacks.explorer({ cwd = LazyVim.root() })
          elseif explorer:is_focused() then
            explorer:close()
          else
            explorer:focus()
          end
        end,
        desc = "Explorer Snacks (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
    },
    opts = {
      indent = {
        filter = function(buf)
          return vim.bo[buf].filetype ~= "markdown"
        end,
      },
      lazygit = {
        win = {
          width = 0.95,
          height = 0.95,
        },
      },
      picker = {
        sources = {
          explorer = {
            -- Always hide .git, even when showing hidden files (H toggle)
            exclude = { ".git" },
            layout = { preset = "sidebar", layout = { width = 50 } },
          },
          git_status = {
            layout = {
              preset = "default",
              layout = {
                width = 0.95,
                height = 0.95,
                [2] = { width = 0.6 },
              },
            },
          },
          files = {
            -- Show dotfiles (.env, .eslintrc, etc.)
            hidden = true,
            -- Exclude .git directory
            exclude = { ".git" },
            layout = {
              preset = "default",
              layout = {
                width = 0.95,
                height = 0.95,
                [2] = { width = 0.6 },
              },
            },
          },
          buffers = {
            layout = {
              preset = "default",
              layout = {
                width = 0.95,
                height = 0.95,
                [2] = { width = 0.6 },
              },
            },
          },
          lines = {
            layout = {
              preset = "default",
              layout = {
                width = 0.95,
                height = 0.95,
                [2] = { width = 0.6 },
              },
            },
          },
          grep = {
            -- Case sensitivity toggle (Alt+S)
            -- Default: case insensitive, toggle to case sensitive
            case_sens = false,
            toggles = { case_sens = "s" },
            finder = function(opts, ctx)
              local flag = "--case-sensitive"
              -- Remove flag from args if present
              opts.args = vim.tbl_filter(function(v)
                return v ~= flag
              end, opts.args or {})
              -- Add flag if case sensitive mode is on
              if opts.case_sens then
                table.insert(opts.args, flag)
              end
              return require("snacks.picker.source.grep").grep(opts, ctx)
            end,
            actions = {
              toggle_case_sens = function(picker)
                picker.opts.case_sens = not picker.opts.case_sens
                picker:find()
              end,
            },
            win = {
              input = {
                keys = {
                  ["<M-s>"] = { "toggle_case_sens", mode = { "i", "n" }, desc = "Toggle case sensitive" },
                },
              },
            },
          },
        },
      },
    },
  },
}
