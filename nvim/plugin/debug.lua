local dap = require("dap")
require("dapui").setup({
})
-- Go
-- Requires:
-- * You have initialized your module with 'go mod init module_name'.
-- * You :cd your project before running DAP.
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = vim.fn.stdpath('data') .. '/mason/packages/delve/dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}
dap.configurations.go = {
    {
        type = "delve",
        name = "Compile module and debug this file",
        request = "launch",
        program = "./${relativeFileDirname}",
    },
    {
        type = "delve",
        name = "Compile module and debug this file (test)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    },
}
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
require("nvim-dap-virtual-text").setup({
})
