-- set_theme = "dayfox"

return {
  { "catppuccin/nvim", name = "catppuccin" },
  { "rafi/awesome-vim-colorschemes" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "NLKNguyen/papercolor-theme",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "EdenEast/nightfox.nvim" }, -- lazy
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {
  --     update_interval = 1000,
  --     set_dark_mode = function()
  --       -- vim.api.nvim_set_option_value("background", "dark", {})
  --       vim.cmd("colorscheme carbonfox")
  --     end,
  --     set_light_mode = function()
  --       vim.api.nvim_set_option_value("background", "light", {})
  --       vim.cmd("colorscheme " .. set_theme)
  --     end,
  --   },
  -- },
}
