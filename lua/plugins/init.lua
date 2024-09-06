-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- load all the snippets
-- require("plugins.snippets.all")

return {

  "folke/which-key.nvim",

  -- new jump and search plugin
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "ö",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "Ö",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
  },

  -- better terminal
  { "akinsho/toggleterm.nvim", version = "*", config = true },

  -- sourrund selection
  "tpope/vim-surround",

  -- sticky scroll
  "nvim-treesitter/nvim-treesitter-context",

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({})
    end,
  },

  -- peek to line before jumping
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup({})
    end,
  },

  -- undotree
  { "mbbill/undotree" },
}
