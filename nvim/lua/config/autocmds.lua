vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.diagnostic.enable(true)
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.md",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Your custom settings or commands for markdown files
    vim.diagnostic.disable()
    vim.opt.spell = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>da", "<cmd>RustLsp debuggables<CR>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dA", "<cmd>RustLsp runnables<CR>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>tr", "<cmd>RustLsp testables<CR>", opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "csv",
  callback = function()
    vim.cmd([[CsvViewEnable]])
  end,
})

-- local augroup = vim.api.nvim_create_augroup("TypeScriptFormatting", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--     vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
--   end,
--   group = augroup,
-- })
