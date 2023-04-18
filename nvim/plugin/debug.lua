local dap = require("dap")
require("dapui").setup({

})
require("mason").setup()
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
