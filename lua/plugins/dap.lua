-- ====================
-- ===== nvim-dap =====
-- ====================
local dapui = require("dapui")
dapui.setup({})

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
    command = '/usr/share/codelldb/extension/adapter/codelldb',
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

local keymap = vim.keymap
keymap.set("n", "<S-r>",":lua require'dap'.continue()<CR>")
keymap.set("n", "<leader>b",":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B",":lua require'dap'.clear_breakpoint()<CR>")
keymap.set("n", "<S-i>",":lua require'dap'.step_into()<CR>")
keymap.set("n", "<S-o>",":lua require'dap'.step_over()<CR>")
keymap.set("n", "<S-t>",":lua require'dap'.step_out()<CR>")
-- My debugger doesn't support step back and reverse;
keymap.set("n", "<S-b>",":lua require'dap'.step_back()<CR>")
keymap.set("n", "<S-c>",":lua require'dap'.reverse_continue()<CR>")
