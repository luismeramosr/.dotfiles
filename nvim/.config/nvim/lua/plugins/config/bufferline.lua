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
  }
})
