require("mason").setup {
    ensure_installed = {
        "codelldb",
    }
}

local dap, dapui = require("dap"), require("dapui")

require("nvim-dap-virtual-text").setup()
require ('mason-nvim-dap').setup({
    handlers = {}, -- sets up dap in the predefined manner
})

dapui.setup()

vim.keymap.set("v", "<leader>ee", dapui.eval)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.continue)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

