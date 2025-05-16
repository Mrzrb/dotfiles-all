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
}
