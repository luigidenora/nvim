vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.o.background == "dark" then
      vim.cmd("colorscheme github_dark_high_contrast")
    else
      vim.cmd("colorscheme github_light")
    end
  end,
})
