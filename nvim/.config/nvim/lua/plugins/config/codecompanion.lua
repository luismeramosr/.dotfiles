require("codecompanion").setup({
    display = {
        action_palette = {
            width = 95,
            height = 10,
            prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
            provider = "telescope",                 -- default|telescope|mini_pick
            opts = {
                show_default_actions = true,        -- Show the default actions in the action palette?
                show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            },
        },
    },
    strategies = {
        chat = {
            adapter = "lm_studio_chat"
        },
        inline = {
            adapter = "lm_studio_completions"
        },
    },
    adapters = {
        lm_studio_chat = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                name = "lm_studio_chat",
                formatted_name = "LM Studio Chat",
                env = {
                    url = "http://localhost:1234",
                    model = "deepseek-r1-race",
                },
                schema = {
                    model = {
                        order = 1,
                        mapping = "parameters",
                        type = "enum",
                        desc = "Description of the model to use",
                        default = "deepseek-r1-distill-qwen-14b",
                    },
                },
            })
        end,
        lm_studio_completions = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                name = "lm_studio_completions",
                formatted_name = "LM Studio Completions",
                env = {
                    url = "http://localhost:1234",
                },
                schema = {
                    model = {
                        order = 1,
                        mapping = "parameters",
                        type = "enum",
                        desc = "Description of the model to use",
                        default = "qwen2.5-coder-14b-instruct",
                    },
                },
            })
        end,
    }
})
