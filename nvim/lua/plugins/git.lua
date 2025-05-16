return {
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        telescope_sorter = function()
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end,
      })
    end,
  },
}
