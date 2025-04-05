local icons = require("nvchad.icons.lspkind")
dofile(vim.g.base46_cache .. "cmp")

return {
    enabled = function()
        return not vim.tbl_contains({}, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.bo.buftype ~= "nvim-tree"
            and vim.b.completion ~= false
    end,
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
        -- set to 'none' to disable the 'default' preset
        preset = "enter",

        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },

        -- disable a keymap from the preset
        ["<C-e>"] = {},

        -- show with a list of providers
        ["<C-space>"] = {
            function(cmp)
                cmp.show({ providers = { "snippets" } })
            end,
        },
    },

    appearance = {
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
    },

    completion = {
        menu = {
            -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
            border = "none",
            draw = {
                padding = { 0, 1}, -- Padding only on the right side
                columns = {
                    { "kind_icon", gap = 1 },
                    { "label", "kind" },
                },
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function(ctx)
                            return " " .. icons[ctx.kind] .. ctx.icon_gap .. " "
                        end,
                    },
                    kind = {
                        highlight = function(ctx)
                            return ""
                        end
                    }
                },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            window = { border = "none" },
        },
        ghost_text = {
            enabled = false
        },
    },
    signature = { window = { border = "none" } },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
            codecompanion = { "codecompanion" },
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
}
