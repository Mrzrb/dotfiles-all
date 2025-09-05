return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      -- Default configuration
      require("tiny-inline-diagnostic").setup({
        -- Style preset for diagnostic messages
        -- Available options:
        -- "modern", "classic", "minimal", "powerline",
        -- "ghost", "simple", "nonerdfont", "amongus"
        preset = "amongus",

        -- transparent_bg = true, -- Set the background of the diagnostic to transparent
        -- transparent_cursorline = true, -- Set the background of the cursorline to transparent (only one the first diagnostic)
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  {
    "folke/trouble.nvim",

    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
}
