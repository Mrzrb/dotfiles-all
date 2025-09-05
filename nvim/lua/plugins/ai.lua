return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-l>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
        -- color = {
        --   -- suggestion_color = "#ffffff",
        --   cterm = 244,
        -- },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            schema = {
              model = {
                default = "cc-3-7-sonnet-20250219",
              },
            },
            env = {
              api_key = "SELF_API_KEY",
              model = "cc-3-7-sonnet-20250219",
            },
            url = "http://23.19.230.164:3000/v1/chat/completions",
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "openai",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "TRACE",
      },
    },
  },
  -- {
  --   "dlants/magenta.nvim",
  --   lazy = false,
  --   build = "npm install --frozen-lockfile",
  --   opts = {
  --     profiles = {
  --       {
  --         name = "SELF_HOSTED",
  --         provider = "anthropic",
  --         model = "cc-3-7-sonnet-20250219",
  --         apiKeyEnvVar = "SELF_API_KEY",
  --         baseUrl = "http://23.19.230.164:3000",
  --       },
  --     },
  --     sidebar_position = "left",
  --     picker = "fzf-lua",
  --     default_keymaps = true,
  --     sidebar_keymaps = {
  --       normal = {
  --         ["<CR>"] = ":Magenta send<CR>",
  --       },
  --     },
  --     inline_keymaps = {
  --       normal = {
  --         ["<CR>"] = function(target_bufnr)
  --           vim.cmd("Magenta submit-inline-edit " .. target_bufnr)
  --         end,
  --       },
  --     },
  --   },
  -- },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = true, -- set this if you want to always pull the latest change
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "v", -- Recommend using Claude
      -- provider = "tencent", -- Recommend using Claude
      claude = {
        endpoint = "https://aiapi.dog",
        model = "claude-3-5-sonnet-20240620",
        temperature = 0,
        max_tokens = 8000,
      },
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-reasoner",
          max_tokens = 8000,
        },
        wulai = {
          __inherited_from = "openai",
          api_key_name = "WULAI_KEY",
          endpoint = "https://api.wlai.vip/v1",
          model = "claude-3-7-sonnet-latest",
        },
        v = {
          __inherited_from = "openai",
          api_key_name = "V3",
          endpoint = "https://api.vveai.com/v1",
          -- model = "claude-3-7-sonnet-20250219",
          model = "cc-sonnet-4-20250514",
          disable_tools = true, -- disable tools!
        },
        tlao = {
          __inherited_from = "openai",
          api_key_name = "TLAO",
          endpoint = "https://tbai.xin/v1",
          -- model = "claude-3-7-sonnet-20250219",
          model = "gemini-2.5-pro",
          disable_tools = true, -- disable tools!
        },
        tencent = {
          __inherited_from = "openai",
          api_key_name = "TENCENT",
          endpoint = "https://api.lkeap.cloud.tencent.com/v1",
          model = "deepseek-v3",
          disable_tools = true, -- disable tools!
        },
      },
      openai = {
        -- endpoint = "https://api.wlai.vip/v1",
        endpoint = "https://api.openai-proxy.org/v1",
        model = "gpt-4o-mini",
        temperature = 0,
        max_tokens = 10000,
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 60, -- default % based on available width
        sidebar_header = {
          align = "center", -- left, center, right for title
          rounded = true,
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
      },
    },

    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
