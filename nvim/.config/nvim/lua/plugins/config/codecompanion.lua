require("codecompanion").setup({
    display = {
        action_palette = {
            width = 45,
            height = 10,
            prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
            provider = "telescope",                 -- default|telescope|mini_pick
            opts = {
                show_default_actions = true,        -- Show the default actions in the action palette?
                show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            },
        },
        chat = {
            window = {
                width = 0.25
            }
        }
    },
    strategies = {
        chat = {
            adapter = "ollama"
        },
        inline = {
            adapter = "ollama_completions"
        },
    },
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                name = "ollama",
                formatted_name = "Ollama",
                env = {
                    url = "http://localhost:11434",
                    model = "qwen2.5-coder:14b",
                },
                schema = {
                    model = {
                        order = 1,
                        mapping = "parameters",
                        type = "enum",
                        desc = "Description of the model to use",
                        default = "qwen2.5-coder:14b",
                    },
                },
            })
        end,
        ollama_completions = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                name = "ollama_completions",
                formatted_name = "Ollama inline completions",
                env = {
                    url = "http://localhost:11434",
                    model = "qwen2.5-coder:14b"
                },
                schema = {
                    model = {
                        order = 1,
                        mapping = "parameters",
                        type = "enum",
                        desc = "Description of the model to use",
                        default = "qwen2.5-coder:14b",
                    },
                },
            })
        end,
    }
})
