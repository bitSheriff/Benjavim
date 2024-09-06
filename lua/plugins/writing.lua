-- Tools and plugins for writing
return {

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },

  "godlygeek/tabular",

  -- for better word wrapping
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup({
        notify_on_switch = false,
        create_keymappings = true,
      })
      require("wrapping").soft_wrap_mode() -- soft wrapping is default
    end,
  },
}
