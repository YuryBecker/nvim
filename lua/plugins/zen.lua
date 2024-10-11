return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>h",
      "<cmd>:ZenMode<cr>",
      "Start Zen Mode",
    },
    {
      "<leader>H",
      "<cmd>:ZenMode<cr>",
      "Stop Zen Mode",
    },
  },
  config = function()
    require("zen-mode").setup({
      window = {
        -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        backdrop = 1.0,

        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        width = 120, -- width of the Zen window
        height = 0.90, -- height of the Zen window

        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        kitty = {
          enabled = true,
        },
      },
    })
  end,
}
