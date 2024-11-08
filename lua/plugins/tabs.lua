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
    keys = {
      {
        "gb",
        function()
          require("snipe").open_buffer_menu({ max_path_width = 1 })
        end,
        desc = "Open Snipe buffer menu",
      },
    },
  },
}
