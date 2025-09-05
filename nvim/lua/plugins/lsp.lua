local util = require("lspconfig.util")

local lsp = {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      codelens = {
        enabled = false,
      },
      document_highlight = {
        enabled = true,
      },
    },
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
              disabled = { "unresolved-proc-macro" },
              enableExperimental = true,
            },
            -- 可以保留之前的其他设置
            procMacro = {
              enable = true,
            },
            cargo = {},
            loadOutDirsFromCheck = true,
          },
        },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
    ft = { "rust" },
    opts = {
      tools = {
        hover_actions = {
          replace_builtin_hover = false,
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                -- ["async-trait"] = { "async_trait" },
                -- ["napi-derive"] = { "napi" },
                -- ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable("rust-analyzer") == 0 then
        LazyVim.error(
          "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
          { title = "rustaceanvim" }
        )
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {},
      },
    },
  },
  {
    -- for gotests generate
    "buoto/gotests-vim",
  },
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            go_test_args = { "-gcflags='all=-l -N'" },
            dap_go_opts = {
              delve = {
                build_flags = { "-gcflags=all=-l -N" },
              },
            },
          }),
        },
      })
    end,
  },
  {
    "crusj/hierarchy-tree-go.nvim",
    config = function()
      require("hierarchy-tree-go").setup({
        icon = {
          fold = "", -- fold icon
          unfold = "", -- unfold icon
          func = "󰆧", -- symbol
          last = "", -- last level icon
        },
        hl = {
          current_module = "guifg=Green", -- highlight cwd module line
          others_module = "guifg=Black", -- highlight others module line
          cursorline = "guibg=Gray guifg=White", -- hl  window cursorline
        },
        keymap = {
          --global keymap
          incoming = "<space>fi", -- call incoming under cursorword
          outgoing = "<space>fo", -- call outgoing under cursorword
          open = "<space>ho", -- open hierarchy win
          close = "<space>hc", -- close hierarchy win
          -- focus: if hierarchy win is valid but is not current win, set to current win
          -- focus: if hierarchy win is valid and is current win, close
          -- focus  if hierarchy win not existing,open and focus
          focus = "<space>fu",

          -- bufkeymap
          expand = "o", -- expand or collapse hierarchy
          jump = "<CR>", -- jump
          move = "<space><space>", -- switch the hierarchy window position, must be current win
        },
      })
    end,
  },
}

return lsp
