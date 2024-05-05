return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qS", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>qs", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      -- { "", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
}
