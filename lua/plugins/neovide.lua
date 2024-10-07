-- Configuration especially for neovide
-- this will only be executed if neovim runs inside neovide

if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

vim.g.neovide_text_gamma = 0.9
vim.g.neovide_text_contrast = 0.1

return {
  -- setting and plugins for neovide
}
