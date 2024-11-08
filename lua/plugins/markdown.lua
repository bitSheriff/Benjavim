return {
  -- Obidian and Markdown stuff
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()", -- if it does not work out of the box, call this function by hand ":call mkdp#util#install()"
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },

  -- another markdown viewer
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Obsidian inside nvim
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    version = "*", -- latest version instead of latest commit
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({

        workspaces = {
          {
            name = "Notes",
            path = "~/notes",
          },
        },
        templates = {
          subdir = "_templates",
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
        daily_notes = {
          folder = "Journal/Entries/Daily",
        },
        disable_frontmatter = true, -- dont let obsidian.nvim change the frontmatter
      })
    end,
  },
}
