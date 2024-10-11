local quotes = require("quotes")

local function get_quote()
  math.randomseed(os.time())

  local index = math.random(1, #quotes)

  return quotes[index]
end

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local quote = get_quote()

    opts.section.header.val = vim.split(quote, "\n", { trimempty = true })
  end,
}
