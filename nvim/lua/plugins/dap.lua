return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()
        require("dap-go").setup()

        -- Handled by nvim-dap-go
        -- dap.adapters.go = {
        --   type = "server",
        --   port = "${port}",
        --   executable = {
        --     command = "dlv",
        --     args = { "dap", "-l", "127.0.0.1:${port}" },
        --   },
        -- }

        vim.keymap.set("n", "br", dap.toggle_breakpoint)
        vim.keymap.set("n", "gb", dap.run_to_cursor)

        -- GDB for C and C++
        if vim.fn.executable('gdb') == 1 then
            require('plugins.debuggers.gdb')
        end

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<S-F11>", dap.step_out)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<S-F10>", dap.step_back)
        vim.keymap.set("n", "<F8>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
