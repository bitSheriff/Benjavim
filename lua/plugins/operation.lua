-- Collection of plugins which improve the general neovim operation
return {

  -- plugin to open file with sudo
  { "lambdalisue/suda.vim" },

  -- escape the insert mode with "jj"
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
