-- Load every Lua file in the plugins directory, in alphabetical order.
-- vim.fs.dir returns entries in filesystem order, which is not guaranteed,
-- and some files depend on others (lsp.lua requires blink.cmp).
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")

local modules = {}
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
	if (type == "file" or type == "link") and file_name:match("%.lua$") and file_name ~= "init.lua" then
		table.insert(modules, (file_name:gsub("%.lua$", "")))
	end
end
table.sort(modules)

for _, module in ipairs(modules) do
	require("plugins." .. module)
end
