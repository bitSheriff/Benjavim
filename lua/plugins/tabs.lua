return {

  -- easy swith tabs/buffers
  {
    "leath-dub/snipe.nvim",
    config = function()
      require("snipe").setup({
        hints = {
          dictrionary = "asdfghjkl",
        },
      })
    end,
    opts = {},
  },
}
