local autocmd = vim.api.nvim_create_autocmd

-- autocmd("BufWritePre *.go", {
--   callback = function()
--     vim.cmd(":silent! lua require('go.format').gofmt()")
--   end
-- })

require("go").setup({
})
