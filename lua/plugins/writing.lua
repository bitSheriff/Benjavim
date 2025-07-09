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
        lazy = true, -- Recommended
        ft = "markdown", -- If you decide to lazy-load anyway

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                app = "qutebrowser",
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },

    -- Viewer for multiple different types
    {
        "sylvanfranklin/omni-preview.nvim",
        dependencies = {
            -- for markdown
            { "toppair/peek.nvim", lazy = true, build = "deno task --quiet build:fast" },
            -- Typst
            { "chomosuke/typst-preview.nvim", lazy = true },
        },
        config = function()
            require("omni-preview").setup()
            require("peek").setup({ app = "browser" })
        end,
        keys = {
            { "<leader>po", "<cmd>OmniPreview start<CR>", desc = "OmniPreview Start" },
            { "<leader>pc", "<cmd>OmniPreview stop<CR>", desc = "OmniPreview Stop" },
        },
    },
}
