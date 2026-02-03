return {
  "toppair/peek.nvim",
  event = "VeryLazy",
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      app = "browser",
      theme = "dark",
      auto_load = true,
      close_on_bdelete = true,
      update_on_change = true,
    })

    vim.keymap.set("n", "mt", function()
      if require("peek").is_open() then
        require("peek").close()
      else
        require("peek").open()
      end
    end, { desc = "Toggle Markdown Preview" })
  end,
}
