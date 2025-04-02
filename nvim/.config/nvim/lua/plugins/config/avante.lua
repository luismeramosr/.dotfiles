return {
    provider = "ollama",
    auto_suggestions_provider = "ollama",    -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    ollama = {
        endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
        model = "qwen2.5-coder:14b",         -- your desired model (or use gpt-4o, etc.)
        timeout = 30000,                     -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0.7,
        max_completion_tokens = 8192,        -- Increase this to include reasoning tokens (for reasoning models)
        options = {
            num_ctx = 10240,
        },
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
    behaviour = {
        auto_suggestions = true, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    mappings = {
        --- @class AvanteConflictMappings
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-CR>",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },
    hints = { enabled = true },
    windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true,        -- similar to vim.o.wrap
        width = 25,         -- default % based on available width
        border = true,
        sidebar_header = {
            enabled = true,   -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8, -- Height of the input window in vertical layout
        },
        edit = {
            border = "rounded",
            start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = false,    -- Open the 'AvanteAsk' prompt in a floating window
            start_insert = true, -- Start insert mode when opening the ask window
            border = "rounded",
            ---@type "ours" | "theirs"
            focus_on_apply = "ours", -- which diff to focus after applying
        },
    },
    highlights = {
        ---@type AvanteConflictHighlights
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    --- @class AvanteConflictUserConfig
    diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
    },
}
