require('gianluca.base')
require('gianluca.highlights')
require('gianluca.maps')
require('gianluca.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('gianluca.macos')
end

if is_win then
  require('gianluca.windows')
end
