-- Configuration especially for neovide
-- this will only be executed if neovim runs inside neovide

if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  -- setting and plugins for neovide
}
