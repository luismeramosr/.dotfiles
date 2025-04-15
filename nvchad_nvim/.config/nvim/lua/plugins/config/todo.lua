local icons = require("icons").misc

return {
    keywords = {
        FIX = {
            icon = icons.fixme,                         -- icon used for the sign, and in search results
            color = "error",                            -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = icons.todo, color = "info" },
        WARN = { icon = icons.warn, color = "warning", alt = { "WARNING" } },
        PERF = { icon = icons.perf, alt = { "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = icons.note, color = "hint", alt = { "INFO" } },
    }
}
