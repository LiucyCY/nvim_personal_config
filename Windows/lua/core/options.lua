-- ==============
-- == 基础设置 ==
-- ==============
local opt = vim.opt
-- 行号和相对行号
opt.number = true
opt.relativenumber = false
-- tab键
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- 忽略大小写
opt.ignorecase = true
-- 智能大小写
opt.smartcase = true
-- 关闭或打开命令等待超时
opt.timeout = false
-- 跳转方式：栈的方式跳转
opt.jumpoptions = stack
-- 防止包裹，让所有的字符都显示在屏幕内
opt.wrap = false
-- 光标行
opt.cursorline = true
-- 启用鼠标
opt.mouse:append("a")
-- 启用剪贴板
opt.clipboard:append("unnamedplus")
-- 使用终端颜色
opt.termguicolors = true
-- 使用真颜色
opt.signcolumn = "yes"
-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- ==========
-- == 键位 ==
-- ==========
vim.g.mapleader = " "
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'
