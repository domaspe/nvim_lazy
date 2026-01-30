return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- Always hide .git, even when showing hidden files (H toggle)
            exclude = { ".git" },
          },
          files = {
            -- Show dotfiles (.env, .eslintrc, etc.)
            hidden = true,
            -- Exclude .git directory
            exclude = { ".git" },
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
