local minuet_enabled = (vim.env.DEEPSEEK_API_KEY or "") ~= ""

local spec = {
  {
    "milanglacier/minuet-ai.nvim",
    cond = minuet_enabled,
    opts = {
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          api_key = "DEEPSEEK_API_KEY",
          name = "deepseek",
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*" },
        keymap = {
          accept = "<Tab>",
          accept_line = "<S-Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-e>",
        },
      },
    },
  },
}

if minuet_enabled then
  table.insert(spec, {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<C-y>"] = {
          function()
            require("minuet").make_blink_map()()
          end,
        },
      },
      sources = {
        default = { "lsp", "path", "buffer", "snippets", "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 50,
          },
        },
      },
      completion = {
        trigger = {
          prefetch_on_insert = false,
        },
      },
    },
  })
end

return spec
