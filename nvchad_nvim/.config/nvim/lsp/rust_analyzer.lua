return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            cachePriming = {
                enable = true,
            },
            lens = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            cargo = {
                buildScripts = {
                    enabled = false,
                },
            },
            procMacro = {
                enable = true,
            },
            completion = {
                autoimport = {
                    enable = true,
                },
                autoself = {
                    enable = true,
                },
            },
        },
    },
}
