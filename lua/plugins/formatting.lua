local function find_ancestor_file(filename, name)
  -- vim.fs.root searches from the source's parent, so pass the file instead of its directory.
  local root = vim.fs.root(filename, name)

  return root and vim.fs.joinpath(root, name) or nil
end

local function markdown_prettier_args(ctx)
  local filetype = vim.bo[ctx.buf].filetype
  local is_markdown = filetype == "markdown" or filetype == "markdown.mdx"

  if not is_markdown then
    return {}
  end

  -- VSCode respects .prettierignore without inheriting the CLI's default .gitignore.
  local args = {
    "--ignore-path",
    find_ancestor_file(ctx.filename, ".prettierignore") or "/dev/null",
  }

  if not find_ancestor_file(ctx.filename, ".prettierrc") then
    vim.list_extend(args, { "--print-width", "100", "--prose-wrap", "always" })
  end

  return args
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          -- conform caches function-valued prepend_args, so config detection belongs in per-run args.
          args = function(self, ctx)
            local prettier = require("conform.formatters.prettier")

            return vim.list_extend(markdown_prettier_args(ctx), prettier.args(self, ctx))
          end,
          range_args = function(self, ctx)
            local prettier = require("conform.formatters.prettier")

            return vim.list_extend(markdown_prettier_args(ctx), prettier.range_args(self, ctx))
          end,
        },
      },
    },
  },
}
