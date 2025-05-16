-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

-- Chat commands
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpRewrite<cr>", keymapOptions("New Chat"))
vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))

vim.api.nvim_set_keymap("n", ",w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<Leader>pr",
      ':lua require("telescope.builtin").grep_string({search = "POST(|GET("})<CR>',
      { noremap = true, silent = true, desc = "gin router" }
    )
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<Leader>pr",
      ':lua require("telescope.builtin").grep_string({search = "PostMapping|GetMapping|RequestMapping"})<CR>',
      { noremap = true, silent = true, desc = "gin router" }
    )
  end,
})

vim.api.nvim_set_keymap(
  "n",
  "<Leader>pT",
  ':lua require("telescope.builtin").grep_string({search = "*testing.T"})<CR>',
  { noremap = true, silent = true, desc = "gin router" }
)

vim.api.nvim_set_keymap("n", "<C-A-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-k>", ":resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-l>", ":vertical resize -6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-h>", ":vertical resize +6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fm",
  ":lua require('telescope.builtin').marks()<CR>",
  { noremap = true, silent = true, desc = "Open Telescope Marks" }
)
-- 在普通模式和插入模式下使用 Command + v 进行粘贴
vim.api.nvim_set_keymap("n", "<D-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", '<C-\\><C-N>"+pi', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", { noremap = true, silent = true })

-- window resize
vim.api.nvim_set_keymap("n", "<C-A-j>", ":resize -1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-k>", ":resize +1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-l>", ":vertical resize -4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-h>", ":vertical resize +4<CR>", { noremap = true, silent = true })

-- neotest-go run near test
local function get_nearest_function_name()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == "function_declaration" then
      return ts_utils.get_node_text(node:child(1))[1]
    end
    node = node:parent()
  end
end

function run_nearest_function()
  local name = get_nearest_function_name()
  if not name then
    return
  end
  print("running: ", name)

  require("neotest").run.run({
    extra_args = { "-run", name },
  })
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tf",
  "<cmd>lua run_nearest_function()<CR>",
  { noremap = true, silent = true, desc = "Test nearest function" }
)

-- vim.api.nvim_set_keymap("n", "<Leader>gg", ":Neogit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>cG", "<cmd>lua formatts()<CR>", { noremap = true, silent = true })
function formatts()
  vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports" } }, apply = true })
end
