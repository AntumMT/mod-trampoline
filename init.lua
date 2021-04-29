
trampoline = {}
trampoline.modname = minetest.get_current_modname()
trampoline.modpath = minetest.get_modpath(trampoline.modname)


minetest.log('action', '[MOD] Loading \'' .. trampoline.modname .. '\' ...')


local scripts = {
	"settings",
	"api",
	"nodes",
	"crafting",
}

for I in pairs(scripts) do
	dofile(trampoline.modpath .. '/' .. scripts[I] .. '.lua')
end

-- Register other colored trampolines
if minetest.global_exists('coloredwood') then
	dofile(trampoline.modpath .. '/colored.lua')
end


minetest.log('action', '[MOD] \'' .. trampoline.modname .. '\' loaded')
