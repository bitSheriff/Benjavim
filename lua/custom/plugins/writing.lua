-- Tools and plugins for writing
return {
  -- Tools for LaTeX and markdown
  "lervag/vimtex",
  "junegunn/goyo.vim", -- distraction-free writing

  -- Obidian and Markdown stuff
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()", -- if it does not work out of the box, call this function by hand ":call mkdp#util#install()"
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
      require("obsidian").setup {

        workspaces = {
          {
            name = "personal",
            path = "~/notes",
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
        daily_notes = {
          folder = "Journal/Entries/Daily",
        },
        disable_frontmatter = true, -- dont let obsidian.nvim change the frontmatter
      }
    end,
  },

  "preservim/vim-markdown",
  "godlygeek/tabular",

  -- for better word wrapping
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup({ notify_on_switch = false, create_keymappings = false, })
    end
  },
}
