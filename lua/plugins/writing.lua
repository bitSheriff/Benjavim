-- Tools and plugins for writing
return {
  -- Tools for LaTeX and markdown

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },

  "junegunn/goyo.vim", -- distraction-free writing

  -- Obidian and Markdown stuff
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()", -- if it does not work out of the box, call this function by hand ":call mkdp#util#install()"
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- Mandatory
      "nvim-tree/nvim-web-devicons", -- Optional but recommended
    },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  -- Obsidian inside nvim
  {
    "epwalsh/obsidian.nvim",
    enabled = false,
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
