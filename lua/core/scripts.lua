vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.o.background == "dark" then
      vim.cmd("colorscheme github_dark_default")
    else
      vim.cmd("colorscheme github_light_default")
    end
  end,
})

local function is_windows_dark_mode()
  local handle = io.popen(
  [[reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme]])
  if not handle then return true end
  local result = handle:read("*a")
  handle:close()
  return result:find("0x0") ~= nil -- Dark mode if value is 0
end

local function syncTheme()
  local dark = is_windows_dark_mode()
  if dark then
    vim.o.background = "dark"
    vim.cmd("colorscheme github_dark_default")
  elseif not dark then
    vim.o.background = "light"
    vim.cmd("colorscheme github_light_default")
  end
end

vim.fn.timer_start(500, syncTheme, { ['repeat'] = -1 })

-- Set the initial theme based on the current Windows mode
syncTheme()
