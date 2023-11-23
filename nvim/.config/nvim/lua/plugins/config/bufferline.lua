local diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local icon = level:match("error") and " " or " "
    return " " .. icon .. count
end

require("bufferline").setup({
    options = {
        separator_style = "padded_slant",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "Project Files",
                highlight = "Directory",
                text_align = "center",
            },
        },
        diagnostics_indicator = diagnostics_indicator,
        name_formatter = function(buf)
            return buf.name
        end,
        custom_filter = function(buf, _)
            -- you can use more custom logic for example
            -- don't show files matching a pattern
            return not vim.fn.bufname(buf):match('/bin/fish')
        end,
    }
})
