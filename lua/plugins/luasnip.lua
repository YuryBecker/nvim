return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = { "~/.config/nvim/snippets" },
      })
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
