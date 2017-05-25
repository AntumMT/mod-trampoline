
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
}

for I in pairs(scripts) do
	dofile(trampoline.modpath .. '/' .. scripts[I] .. '.lua')
end


minetest.register_node("trampoline:trampoline", {
	description = "Trampoline",
	drawtype = "nodebox",
	node_box = trampoline.box,
	selection_box = trampoline.box,
	paramtype = "light",
	tiles = {
		"top.png",
		"bottom.png",
		"sides.png^sides_overlay.png"
	},
	groups = {dig_immediate=2, bouncy=20+20, fall_damage_add_percent=-70},
})

minetest.register_alias("trampoline", "trampoline:trampoline")

minetest.register_craft({
	output = "trampoline:trampoline",
	recipe = {
		{"technic:rubber", "technic:rubber", "technic:rubber"},
		{"default:wood", "default:wood", "default:wood"},
		{"default:stick", "default:stick", "default:stick"}
	}
})


-- *** Colored Trampolines ***

-- BROWN TRAMP

minetest.register_node("trampoline:trampoline_brown", {
	description = "Brown Trampoline",
	drawtype = "nodebox",
	node_box = trampoline.box,
	selection_box = trampoline.box,
	paramtype = "light",
	tiles = {
		"top.png",
		"bottom.png",
		"sides.png^sides_overlay_brown.png"
	},
	groups = {dig_immediate=2, bouncy=20+20, fall_damage_add_percent=-70},
})

minetest.register_alias("brown_trampoline", "trampoline:trampoline_brown")

minetest.register_craft({
	output = "trampoline:trampoline_brown",
	recipe = {
		{"technic:rubber", "technic:rubber", "technic:rubber"},
		{"default:junglewood", "default:junglewood", "default:junglewood"},
		{"default:stick", "default:stick", "default:stick"}
	}
})


-- Register other colored trampolines
if minetest.global_exists('coloredwood') then
	dofile(trampoline.modpath .. '/colored.lua')
end


minetest.log("action", "[MOD] '" .. trampoline.modname .. "' loaded")
