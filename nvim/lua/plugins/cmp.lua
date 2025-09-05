return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      local kind_icons = {
        Text = "󰉿",
        Method = "󰆧 ",
        Function = "󰊕 ",
        Constructor = " ",
        Field = "ඞ",
        Variable = "󰂡 ",
        Class = "󰠱 ",
        Interface = " ",
        Module = " ",
        Property = "󰜢 ",
        Unit = " ",
        Value = "󰎠 ",
        Enum = " ",
        Keyword = "󰌋 ",
        Snippet = " ",
        Color = "󰏘 ",
        File = "󰈙 ",
        Reference = " ",
        Folder = "󰉋 ",
        EnumMember = " ",
        Constant = "󰏿",
        Struct = " ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰅲 ",
        Supermaven = " ",
      }

      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          -- { name = "supermaven" },
        }, {
          { name = "buffer" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),

        window = {
          completion = {
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(_, vim_item)
            vim_item.kind = string.format(" %s", kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
            return vim_item
          end,
        },
        sorting = defaults.sorting,
      }
    end,
    main = "lazyvim.util.cmp",
  },
}
