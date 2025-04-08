local quotes = require("quotes")

local function get_quote()
  math.randomseed(os.time())

  local quote = quotes[math.random(#quotes)]

  return quote
end

return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = get_quote(),
      },
    },
  },
}
