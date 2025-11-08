-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local colorscheme_path = vim.fn.stdpath("data") .. "/colorscheme_name"
-- Save the colorscheme name to a file whenever it changes
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(params)
        -- Write the current colorscheme name (params.match) to the file
        local file = io.open(colorscheme_path, "w")
        if file then
            file:write(params.match)
            file:close()
        end
    end,
})

-- Restore the colorscheme on startup
local function load_colorscheme()
    local file = io.open(colorscheme_path, "r")
    if file then
        local scheme = file:read("*l")
        file:close()
        if scheme and scheme ~= "" then
            pcall(vim.cmd.colorscheme, scheme)
        end
    end
end

if vim.v.vim_did_enter == 1 then
    -- VimEnter has already fired, so load colorscheme immediately
    load_colorscheme()
else
    -- Schedule colorscheme loading for VimEnter
    vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = load_colorscheme,
    })
end

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = false
    end,
})
