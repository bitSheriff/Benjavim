return {
  -- git stuff
  "kdheepak/lazygit.nvim",

  -- plugin to open file with sudo
  { "lambdalisue/suda.vim" },

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },
}
