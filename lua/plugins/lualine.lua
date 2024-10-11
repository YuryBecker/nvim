return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
        return {
            options = {
                globalstatus = true,
            },
        }
    end,
}
