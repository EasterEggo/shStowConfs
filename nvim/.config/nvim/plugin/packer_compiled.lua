-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/easteregg/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/easteregg/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/easteregg/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/easteregg/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/easteregg/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neorg = {
    config = { "\27LJ\1\2Õ\1\0\0\6\0\14\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\f\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\t\0003\4\a\0003\5\6\0:\5\b\4:\4\n\3:\3\v\2:\2\r\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/neorg"
  },
  neovim = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/neovim"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/nvim-cursorline"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/nvim-tetris"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/easteregg/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\1\2Õ\1\0\0\6\0\14\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\f\0003\2\3\0002\3\0\0:\3\4\0022\3\0\0:\3\5\0023\3\t\0003\4\a\0003\5\6\0:\5\b\4:\4\n\3:\3\v\2:\2\r\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
