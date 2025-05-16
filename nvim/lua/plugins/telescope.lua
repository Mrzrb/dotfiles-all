return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- 设置布局策略为垂直布局
          layout_strategy = "current_buffer",
          layout_config = {
            vertical = {
              -- 宽度比例
              width = 0.8,
              -- 高度比例
              height = 0.9,
              -- 预览窗口的位置
              preview_cutoff = 40,
              -- 结果窗口的位置
              results_width = 0.6,
              -- 预览窗口的位置
              preview_width = 0.4,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
}
