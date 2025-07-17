-- Collection of plugins which improve the general neovim operation
return {

    -- plugin to open file with sudo
    { "lambdalisue/suda.vim" },

    -- escape the insert mode with "jj"
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- use black hole register for deleting
    {
        "gbprod/cutlass.nvim",
        opts = {
            cut_key = "X",
            override_del = nil,
            exclude = {},
            registers = {
                select = "_",
                delete = "_",
                change = "_",
            },
        },
    },

    -- better marks
    -- mark with: ma (local) or mA (global)
    -- jump to mark with :Marko or "
    {
        "developedbyed/marko.nvim",
        config = function()
            require("marko").setup({
                width = 100,
                height = 100,
                border = "rounded",
                title = " Marks ",
            })
        end,
    },
}
