local ui = {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "corbonfox",
      colorscheme = set_theme,
      icons = {
        diagnostics = {
          Error = "✘",
          Warn = "∅",
          Hint = "•",
          Info = "ℹ",
        },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", mode = "n" },
    },
    opts = {
      window = {
        width = 0.5, -- width will be 85% of the editor width
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        width = 18,
        preset = {
          keys = {
            -- file  icon
            { icon = "📄", key = "f", desc = " ̲find file", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "🆕", key = "n", desc = " ̲new file", action = ":ene | startinsert" },
            { icon = "🔍", key = "g", desc = " ̲grep text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "📂", key = "r", desc = " ̲recent file", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = "⚙️",
              key = "c",
              desc = " ̲config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "💾", key = "s", desc = " ̲session", section = "session" },
            { icon = "⚡", key = "L", desc = " ̲Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = "❌", key = "q", desc = " ̲quit", action = ":qa" },
          },
          header = [[
                                                                   
      ████ ██████           █████      ██              @Robin
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]],
        },
        formats = {
          key = { "" },
        },
      },
    },
  },
}

return ui
