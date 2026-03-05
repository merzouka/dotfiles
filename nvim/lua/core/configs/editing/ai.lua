-- CopilotChat
-- Useful settings: Disable debug mode, set a default model (e.g., 'gpt-4o'), and add an autocmd to customize the chat buffer (e.g., no line numbers).

require("CopilotChat").setup {
  debug = false,  -- Disable debug logging (set to true if you need troubleshooting)
  model = 'gpt-4o',  -- Default model; can be changed via :CopilotChatModels
  layout = 'vertical',  -- Opens chat in a vertical split (on the right with splitright)
  width = 0.25,
  auto_fold = true,  -- Automatically fold non-assistant messages for cleaner view
  headers = {  -- Customize message headers for clarity
    user = 'You',
    assistant = 'Copilot',
    tool = 'Tool',
  },
  separator = '─',  -- Horizontal separator between messages

  -- Custom autocmd for chat buffer enhancements (useful for a clean UI)
  autocmd = {
    BufEnter = {
      pattern = 'copilot-*',
      callback = function()
        vim.opt_local.relativenumber = false  -- No relative line numbers
        vim.opt_local.number = false  -- No absolute line numbers
        vim.opt_local.wrap = true  -- Wrap long lines
      end,
    },
  },
}

vim.keymap.set('n', '<leader>it', ':CopilotChatToggle<CR>',  { desc = '[I]ntelligence [T]oggle' })
vim.keymap.set('n', '<leader>im', ':CopilotChatModels<CR>',  { desc = '[I]ntelligence [M]odel' })
vim.keymap.set('n', '<leader>ip', ':CopilotChatPrompts<CR>', { desc = '[I]ntelligence [P]rompts' })
vim.keymap.set('n', '<leader>is', ':CopilotChatSave<CR>',    { desc = '[I]ntelligence [S]ave' })
vim.keymap.set('n', '<leader>ir', ':CopilotChatReset<CR>',   { desc = '[I]ntelligence [R]eset' })
vim.keymap.set('n', '<leader>il', ':CopilotChatLoad<CR>',    { desc = '[I]ntelligence [L]oad' })

-- Copilot

require("copilot").setup({
    suggestion = {
        enabled = true,          -- Enable inline suggestions
        auto_trigger = true,     -- Show suggestions automatically (no manual trigger needed)
        accept = false,          -- Disable default <Tab> accept → we handle it manually below
    },

    panel = {
        enabled = false,         -- Disable the panel (the side preview of multiple suggestions)
    },

    filetypes = {
        markdown = false,
        help = true,
        html = true,
        javascript = true,
        typescript = true,
        -- Add more filetypes if needed, e.g. python = true, lua = true
        -- Use false to disable for certain types: ["*"] = false, python = true
    },
})

-- Custom <Tab> behavior in insert mode:
--   - If a Copilot suggestion is visible → accept it
--   - Otherwise → insert a normal tab
vim.keymap.set("i", "<Tab>", function()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
    else
        -- Fall back to normal <Tab>
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
        )
    end
end, {
        silent = true,
        desc = "Accept Copilot suggestion or insert tab",
    })

-- <leader>ia → accept suggestion (alternative to Tab)
vim.keymap.set("i", "<leader>ia", function()
    require("copilot.suggestion").accept()
end, { desc = "[I]ntelligence [A]ccept" })

-- <leader>ii → dismiss current suggestion and trigger a new one (kind of "edit")
vim.keymap.set("i", "<leader>ii", function()
    require("copilot.suggestion").dismiss()
    require("copilot.suggestion").trigger()
end, { desc = "[I]ntelligence [I]gnore" })

vim.keymap.set("n", "<leader>ic", function()
    require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "[I]ntelligence [C]omplete Toggle" })
