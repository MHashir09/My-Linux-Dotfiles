-- This uses a custom theme defined in nvim/colors/custom.lua

return {
  dir = "~/.config/nvim/colors",
  config = function()
    vim.cmd.colorscheme("custom")
  end,
}
