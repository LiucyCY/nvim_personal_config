-- ====================
-- ===== nvim-dap =====
-- ====================
local dapui = require("dapui")
dapui.setup({
layouts = {
        {
            -- 将屏幕分为两部分，这是左边的部分
            -- size里的值是百分比，总和为1，分别占比多少
            elements = {
                {id = 'scopes',size = 0.15},
                {id = "stacks", size = 0.125},
                {id = "breakpoints", size = 0.125},
                {id = "repl", size=0.35 },
                {id = "console", size = 0.25}
            },
            size = 40,
            position = "left",
        },
        -- 屏幕下方的部分，按照个人习惯，只放监事变量的窗口
        -- 总大小设为8px
        {
            elements = {
                {id = "watches", size = 1},
            },
            size = 8;
            position = "bottom",
        }
    },
})

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

-- virtual-text 保持默认
require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = '<module',
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})

-- 关于代码调试的配置
local dap = require("dap")
dap.adapters.codelldb = {
  type = 'server',
  -- 端口不用自己指定
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = 'C:\\Users\\Lcy.LIUCY\\.vscode\\extensions\\vadimcn.vscode-lldb-1.9.1\\adapter\\codelldb.exe',
    args = {"--port", "${port}"},
  }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            -- 输入可执行文件的文件名
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local keymap = vim.keymap
keymap.set("n", "<S-r>",":lua require'dap'.continue()<CR>")
keymap.set("n", "<leader>b",":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B",":lua require'dap'.clear_breakpoint()<CR>")
keymap.set("n", "<C-i>",":lua require'dap'.step_into()<CR>")
keymap.set("n", "<C-u>",":lua require'dap'.step_over()<CR>")
keymap.set("n", "<C-t>",":lua require'dap'.step_out()<CR>")
-- My debugger doesn't support step back and reverse;
keymap.set("n", "<S-b>",":lua require'dap'.step_back()<CR>")
keymap.set("n", "<S-c>",":lua require'dap'.reverse_continue()<CR>")
