-- Collection of plugins which improve the general neovim operation
return {

  -- escape the insert mode with "jj"
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
