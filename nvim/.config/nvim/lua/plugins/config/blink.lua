return {
    enabled = function()
        return not vim.tbl_contains({}, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
    end,
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
        -- set to 'none' to disable the 'default' preset
        preset = 'enter',

        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },

        -- disable a keymap from the preset
        ['<C-e>'] = {},

        -- show with a list of providers
        ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
    },

    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',

    },

    completion = {
        menu = {
            winhighlight =
            'Normal:None,FloatBorder:None,CursorLine:BlinkCmpMenuSelection,Search:None',
            border = "rounded",
            draw = {
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function(ctx)
                            local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                            return kind_icon
                        end,
                        -- Optionally, you may also use the highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    }
                }
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 400,
            window = { border = "rounded" },
        },
    },
    signature = { window = { border = "rounded" } },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
        per_filetype = {
            codecompanion = { 'codecompanion' }
        }
    },
}
