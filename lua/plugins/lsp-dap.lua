local dap = require("dap")

-- setup cpptools adapter
dap.adapters.cpptools = {
  type = "executable",
  name = "cpptools",
  command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
  args = {},
  attach = {
    pidProperty = "processId",
    pidSelect = "ask",
  },
}

-- this configuration should start cpptools and the debug the executable main in the current directory when executing :DapContinue
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = "${workspaceFolder}/main",
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

-- Tools and plugins for writing
return {
  -- Tools for Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,
    ft = { "rust" },
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  -- plugin to run justfiles
  {
    "al1-ce/just.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "rcarriga/nvim-notify",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("just").setup({
        fidget_message_limit = 32, -- limit for length of fidget progress message
        play_sound = false, -- plays sound when task is finished or failed
        open_qf_on_error = true, -- opens quickfix when task fails
        open_qf_on_run = true, -- opens quickfix when running `run` task (`:JustRun`)
        telescope_borders = { -- borders for telescope window
          prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      })
    end,
  },
}
