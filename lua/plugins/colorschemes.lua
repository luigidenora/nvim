-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   opts = { transparent_background = true },
--   configs = function(_, opts)
--     require('catpuccin.config').setup(opts)
--   end
-- }
return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    options = {
--      transparent = true,
--      terminal_colors = true,
    }
  },
  config = function(_, opts)
    require('github-theme').setup(opts)
  end,
}
