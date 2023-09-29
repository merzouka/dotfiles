local util = require("formatter.util")

local function prettierd(lang)
    return  {
        require("formatter.filetypes." .. lang).prettierd,
        function ()
            return {
                exe = "prettierd",
                args = {
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--tab-width 4",
                },
                stdin = true,
            }
        end
    }
end

require("formatter").setup {
    filetype = {
        javascript = prettierd("javascript"),
        typescript = prettierd("typescript"),
        html = prettierd("html"),
        css = prettierd("css"),
    },
    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
    }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function ()
        vim.cmd("Format")
    end
})
