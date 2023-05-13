vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Tab键选择、Shift-Tab取消选择
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 回车 选中补全
-- <C-j> 打开片段补全，需要安装插件coc-snippets
-- <C-o> 打开代码补全
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-o>", "coc#refresh()", {silent = true, expr = true})

-- [g 和 ]g 跳转到下一个报错的地方
-- <C-D> 显示所有报错信息
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
keyset("n", "<C-D>", ":CocDiagnostics<CR>", {silent = true})

-- gd 跳转到函数定义, gr跳转到函数被调用的地方
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- K 打开函数文档，在查看一些系统接口时还是挺好用的
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- <leader>rn 重命名， 很好用！
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- <leader>f对选中代码进行格式化，比vim自带的=还用
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- <C-f> and <C-b> 向前向后滚动屏幕
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

local opts = {silent = true, nowait = true}
-- <leader>a 显示所有报错
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- <leader>e 管理插件
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- <leader>c 显示所有CocList的命令
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- <leader>o 显示文档大纲，可以用来函数跳转
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- <C-p> 搜索变量、类名、函数名等符号
keyset("n", "<C-p>", ":<C-u>CocList -I symbols<cr>", opts)
