return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		dashboard = {
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
			},
		},
        terminal = { enabled = true },
        notifier = { enabled = true },
	},
    keys = {
        -- // -- Keybinds for snacks terminal -- // --
        { "t", function() Snacks.terminal() end, desc = "Toggle Snacks Terminal", mode = { "n", "t" } },
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" }),
        vim.keymap.set({ "n", "t" }, "tf", "<Cmd>wincmd p<CR>", { desc = "Previous Window" }),
    },
}
