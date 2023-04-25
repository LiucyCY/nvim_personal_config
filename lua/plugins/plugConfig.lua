-- ===================== 
-- ==== Nvim Tree ====== 
-- =====================
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults
require("nvim-tree").setup()

local keymap = vim.keymap
-- 打开或关闭nvimtree
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
-- 将光标至于文件树
keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>")


-- ====================
-- ==== Markdown ====== 
-- ====================
-- 打开与关闭
keymap.set("n", "<leader>m", ":MarkdownPreview<CR>")
keymap.set("n", "<leader>q", ":MarkdownPreviewStop<CR>")
-- 切换
-- keymap.set("n", "<leader>t", ":MarkdownPreviewToggle<CR>")
-- 只有md文件才能使用
--

-- ====================
-- ==== VimSpector ====
-- ====================
keymap.set("n", "<leader>r","<Plug>VimspectorContinue")
keymap.set("n", "<leader>b","<Plug>VimspectorToggleBreakpoint")
keymap.set("n", "<leader>si","<Plug>VimspectorStepInto")
keymap.set("n", "<leader>so","<Plug>VimspectorStepOut")
keymap.set("n", "<leader>jn","<Plug>VimspectorJumpToNextBreakpoint")

