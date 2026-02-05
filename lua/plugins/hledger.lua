return {
    {
        "davidhelbig/hledger.nvim",
        config = function()
            vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
                pattern = { "*.hledger" },
                callback = function()
                    local hledger = require("hledger")
                    hledger.check({ strict = true })
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "ledger",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            events = { "BufWritePost", "BufReadPost", "InsertLeave" },
            linters_by_ft = {
                ledger = { "hledger" },
            },
            linters = {},
        },
    },
    {
        "ledger/vim-ledger",
        version = false,
        ft = "ledger",
        init = function()
            vim.g.ledger_bin = "hledger"
            vim.g.ledger_fuzzy_account_completion = 1
            vim.g.ledger_date_format = "%Y-%m-%d"
            vim.g.ledger_align_at = 70
            vim.cmd([[
        function LedgerSort() range
          execute a:firstline .. ',' .. a:lastline .. '! hledger -f - -I print'
          execute a:firstline .. ',' .. a:lastline .. 's/^    /  /g'
          execute a:firstline .. ',' .. a:lastline .. 'LedgerAlign'
        endfunction
        command -range LedgerSort :<line1>,<line2>call LedgerSort()
      ]])
        end,
        opt = {},
    },
    -- {
    --     "ptimoney/hledger-nvim",
    --     ft = { "hledger", "journal", "ledger" },
    --     dependencies = { "neovim/nvim-lspconfig" },
    --     opts = {
    --         -- Keymap for :HledgerGraph (default: "<leader>hg")
    --         -- Set to false to disable, or customize to your preference
    --         keymap = "<leader>hg", -- or false to disable, or "<C-g>" etc.
    --
    --         lsp_opts = {
    --             settings = {
    --                 hledgerLanguageServer = {
    --                     inlayHints = {
    --                         showRunningBalances = true,
    --                     },
    --                     validation = {
    --                         undeclaredAccounts = true,
    --                     },
    --                 },
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("hledger").setup(opts)
    --     end,
    -- },
}
