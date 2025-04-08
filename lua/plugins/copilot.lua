return {
  "zbirenbaum/copilot.lua",
  optional = true,
  opts = function()
    --TODO: Remove once the status error is fixed:
    require("copilot.api").status = require("copilot.status")
  end,
}
