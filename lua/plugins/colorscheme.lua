return {

    -- Actual colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    { "EdenEast/nightfox.nvim" },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    },

    { "catppuccin/nvim", name = "catppuccin" },

    {
        "LunarVim/synthwave84.nvim",
        config = function()
            require("synthwave84").setup({
                glow = {
                    error_msg = true,
                    type2 = true,
                    func = true,
                    keyword = true,
                    operator = true,
                    buffer_current_target = true,
                    buffer_visible_target = true,
                    buffer_inactive_target = true,
                },
            })
        end,
    },

    { "rebelot/kanagawa.nvim" },
    { "maxmx03/dracula.nvim" },

    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    { "savq/melange-nvim" },

    {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,
        config = function()
            require("neopywal").setup({
                -- use_wallust = true,
                -- colorscheme_file = os.getenv("HOME") .. "/.cache/wallust/colors_neopywal.vim",
            })
        end,
    },

    {
        "ianklapouch/wildberries.nvim",
        name = "wildberries",
    },
}
