return {
  {
    {
      "3rd/image.nvim",
      event = "VeryLazy",
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter",
          build = ":TSUpdate",
          config = function()
            require("nvim-treesitter.configs").setup({
              ensure_installed = { "markdown" },
              highlight = { enable = true },
            })
          end,
        },
      },
      opts = {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "norg" },
          },
        },
        -- max_width = nil,
        -- max_height = nil,
        max_width_window_percentage = "100",
        max_height_window_percentage = "100",
        -- window_overlap_clear_enabled = true,
        kitty_method = "normal",
      },
    },
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Episodes/travel/notes/neorg/Robin",
              },
              default_workspace = "notes",
            },
          },
        },
      })

      -- vim.wo.foldlevel = 99
      -- vim.wo.conceallevel = 2
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
}
