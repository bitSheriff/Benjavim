-- lock Zellij so no nvim keymaps get interpreted by zellij
if vim.env.ZELLIJ ~= nil then
    vim.fn.system({ "zellij", "action", "switch-mode", "locked" })
end

local custom_header = {
    "                                                                                                                                        ",
    "BBBBBBBBBBBBBBBBB                                          jjjj                                           iiii                          ",
    "B::::::::::::::::B                                        j::::j                                         i::::i                         ",
    "B::::::BBBBBB:::::B                                        jjjj                                           iiii                          ",
    "BB:::::B     B:::::B                                                                                                                    ",
    "  B::::B     B:::::B    eeeeeeeeeeee    nnnn  nnnnnnnn   jjjjjjj  aaaaaaaaaaaaavvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm   ",
    "  B::::B     B:::::B  ee::::::::::::ee  n:::nn::::::::nn j:::::j  a::::::::::::av:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm ",
    "  B::::BBBBBB:::::B  e::::::eeeee:::::een::::::::::::::nn j::::j  aaaaaaaaa:::::av:::::v       v:::::v   i::::i m::::::::::mm::::::::::m",
    "  B:::::::::::::BB  e::::::e     e:::::enn:::::::::::::::nj::::j           a::::a v:::::v     v:::::v    i::::i m::::::::::::::::::::::m",
    "  B::::BBBBBB:::::B e:::::::eeeee::::::e  n:::::nnnn:::::nj::::j    aaaaaaa:::::a  v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m",
    "  B::::B     B:::::Be:::::::::::::::::e   n::::n    n::::nj::::j  aa::::::::::::a   v:::::v v:::::v      i::::i m::::m   m::::m   m::::m",
    "  B::::B     B:::::Be::::::eeeeeeeeeee    n::::n    n::::nj::::j a::::aaaa::::::a    v:::::v:::::v       i::::i m::::m   m::::m   m::::m",
    "  B::::B     B:::::Be:::::::e             n::::n    n::::nj::::ja::::a    a:::::a     v:::::::::v        i::::i m::::m   m::::m   m::::m",
    "BB:::::BBBBBB::::::Be::::::::e            n::::n    n::::nj::::ja::::a    a:::::a      v:::::::v        i::::::im::::m   m::::m   m::::m",
    "B:::::::::::::::::B  e::::::::eeeeeeee    n::::n    n::::nj::::ja:::::aaaa::::::a       v:::::v         i::::::im::::m   m::::m   m::::m",
    "B::::::::::::::::B    ee:::::::::::::e    n::::n    n::::nj::::j a::::::::::aa:::a       v:::v          i::::::im::::m   m::::m   m::::m",
    "BBBBBBBBBBBBBBBBB       eeeeeeeeeeeeee    nnnnnn    nnnnnnj::::j  aaaaaaaaaa  aaaa        vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm",
    "                                                          j::::j                                                                        ",
    "                                                jjjj      j::::j                                                                        ",
    "                                               j::::jj   j:::::j                                                                        ",
    "                                               j::::::jjj::::::j                                                                        ",
    "                                                jj::::::::::::j                                                                         ",
    "                                                  jjj::::::jjj                                                                          ",
    "                                                     jjjjjj                                                                             ",
    "",
}

return {

    -- nvim start up page
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    header = custom_header,
                    week_header = {
                        enable = false,
                    },
                    shortcut = {
                        { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
                        {
                            icon = " ",
                            icon_hl = "@variable",
                            desc = "Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = " Apps",
                            group = "DiagnosticHint",
                            action = "Lazy",
                            key = "a",
                        },
                        {
                            desc = " dotfiles",
                            group = "Number",
                            action = "Telescope find_files",
                            key = "d",
                        },
                    },
                    project = {
                        enable = false,
                        limit = 8,
                        icon = "󰺛 ",
                        label = "bitSheriff",
                        action = "Telescope find_files cwd=",
                    },
                    mru = { limit = 10, icon = "󰺛 ", label = "bitSheriff" },
                    footer = { " 󱑽 ride on the synthwave 󱑽 " },
                },
            })
        end,
    },

    -- zen mode
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
            })
        end,
    },

    -- Tabs
    {
        "akinsho/nvim-bufferline.lua",
        enabled = true,
        config = function()
            require("bufferline").setup({})
        end,
    },

    -- view hex colors_name
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    },

    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    -- command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },

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
