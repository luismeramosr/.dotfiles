local signs = require("icons").git

require("gitsigns").setup({
    signs = {
        add = { text = signs.add },
        change = { text = signs.change },
        delete = { text = signs.delete },
        untracked = { text = signs.untracked },
    },
    signs_staged = {
        add = { text = signs.add },
        change = { text = signs.change },
        delete = { text = signs.delete },
        untracked = { text = signs.untracked },
    },
    on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk changes" })
        map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage hunk changes" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Undo hunk changes" })
        map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Undo selected hunk changes" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage all buffer changes" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git blame" })
        map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle git deleted lines" })
    end,
})
