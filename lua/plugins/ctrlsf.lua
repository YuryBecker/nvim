return {
  "dyng/ctrlsf.vim",
  keys = {
    {
      "<leader>S",
      function()
        vim.cmd("CtrlSF")
      end,
      "Search files",
    },
  },
  config = function() end,
}
