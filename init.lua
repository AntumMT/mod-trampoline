
trampoline = {}
trampoline.modname = minetest.get_current_modname()
trampoline.modpath = minetest.get_modpath(trampoline.modname)


minetest.log("action", "[MOD] Loading '" .. trampoline.modname .. "' ...")


trampoline.box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.2, -0.5,  0.5,    0,  0.5},

		{-0.5, -0.5, -0.5, -0.4, -0.2, -0.4},
		{ 0.4, -0.5, -0.5,  0.5, -0.2, -0.4},
		{ 0.4, -0.5,  0.4,  0.5, -0.2,  0.5},
		{-0.5, -0.5,  0.4, -0.4, -0.2,  0.5},
		}
}


local scripts = {
	'functions',
	'nodes',
	'crafting',
}

for I in pairs(scripts) do
	dofile(trampoline.modpath .. '/' .. scripts[I] .. '.lua')
end


minetest.register_alias("trampoline", "trampoline:trampoline")


-- *** Colored Trampolines ***

-- BROWN TRAMP

minetest.register_alias("brown_trampoline", "trampoline:trampoline_brown")


-- Register other colored trampolines
if minetest.global_exists('coloredwood') then
	dofile(trampoline.modpath .. '/colored.lua')
end


minetest.log("action", "[MOD] '" .. trampoline.modname .. "' loaded")
