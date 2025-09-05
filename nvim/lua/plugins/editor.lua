return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.install").compilers = { "gcc" }
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          go = {
            template = {
              annotation_convention = "godoc",
              godoc = {
                { nil, "@Summary $1" },
                { nil, "@Description " },
                { nil, "@Tags %s" },
                { nil, "@Accept %s" },
                { nil, "@Produce %s" },
                { nil, '@Param request body|query objType true "参数"' },
                { nil, "@Success 200 {object} any" },
                { nil, "@Router /xx/xx [post|get]" },
              },
            },
          },
        },
      })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "rcarriga/nvim-notify",
    config = function(_, opts)
      local notify = require("notify")
      notify.setup({
        max_width = 50,
        icons = {
          DEBUG = "🐛",
          ERROR = "🚨",
          INFO = "🦕",
          TRACE = "📖",
          WARN = "🫨",
        },
        stages = "fade",
        timeout = 200,
        render = "compact",
        background_colour = "#000",
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local animation_frame = 1
      local animation_frames = { "✶", "✸", "✹", "✺", "✹", "✷" }

      local function sus_indicator()
        local current_frame = animation_frame
        animation_frame = (animation_frame % #animation_frames) + 1
        return animation_frames[current_frame]
      end

      local animation_frame_active_placeholder = 1
      local animation_frames_active_placeholder = {
        "ඬ",
        "ඩ",
        "ඣ",
        "ඪ",
        "ච",
        "ඔ",
        "ඕ",
        "ඖ",
        "ධ",
        "ඛ",
        "ඹ",
      }
      local function active_placeholder_indicator()
        local current_frame = animation_frame_active_placeholder
        animation_frame_active_placeholder = (animation_frame_active_placeholder % #animation_frames_active_placeholder)
          + 1
        return animation_frames_active_placeholder[current_frame]
      end

      require("lualine").setup({
        options = {
          component_separators = { left = "•", right = "•" },
          section_separators = { left = "", right = "" },
          refresh = {
            statusline = 100,
          },
        },
        sections = {
          lualine_a = {
            { active_placeholder_indicator, color = { fg = "#f0a56c", gui = "bold" } },
            {
              "mode",
              color = { fg = "", gui = "bold" },
            },
          },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { sus_indicator, color = { fg = "#ff6600", gui = "bold" } } },
          lualine_x = {
            {
              "filename",
              path = 1,
              shorting_target = 15,
              file_status = true,
              color = { fg = "#f0a56c", gui = "bold" },
            },
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
