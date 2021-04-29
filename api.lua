-- Functions for trampoline mod


-- Log messages specific to trampoline mod
trampoline.log = function(message)
	minetest.log('action', '[' .. trampoline.modname .. '] ' .. message)
end

-- trampoline shape
local box = {
	type = "fixed",
	fixed = {
		{-0.5, -0.2, -0.5,  0.5,    0,  0.5},

		{-0.5, -0.5, -0.5, -0.4, -0.2, -0.4},
		{ 0.4, -0.5, -0.5,  0.5, -0.2, -0.4},
		{ 0.4, -0.5,  0.4,  0.5, -0.2,  0.5},
		{-0.5, -0.5,  0.4, -0.4, -0.2,  0.5},
	}
}


-- Define function to add a colored trampoline
trampoline.addColoredTrampNode = function(color, bounce)
	minetest.register_node('trampoline:' .. color, {
		description = color:gsub('^%l', string.upper) .. ' Trampoline',
		drawtype = 'nodebox',
		node_box = box,
		selection_box = box,
		paramtype = 'light',
		tiles = {
			'top.png',
			'bottom.png',
			'sides.png^sides_overlay_' .. color .. '.png'
		},
		groups = {dig_immediate=2, bouncy=bounce, fall_damage_add_percent=-trampoline.damage_absorb},
	})

	local aliases = {
		'trampoline:trampoline_' .. color,
		'trampoline:tramp_' .. color,
		'trampoline_' .. color,
		'tramp_' .. color,
		color .. '_trampoline',
		color .. '_tramp',
	}

	for I in pairs(aliases) do
		minetest.register_alias(aliases[I], 'trampoline:' .. color)
	end
end


-- Define function to add a colored trampoline craft recipe
trampoline.addColoredTrampCraft = function(color)
	minetest.register_craft({
		output = 'trampoline:' .. color,
		recipe = {
			{'technic:rubber', 'technic:rubber', 'technic:rubber'},
			{'coloredwood:wood_' .. color, 'coloredwood:wood_' .. color, 'coloredwood:wood_' .. color},
			{'default:stick', 'default:stick', 'default:stick'}
		}
	})
end

--- Register a new trampoline.
--
--  Definition attributes:
--  - `description`: Text description
--  - `overlay`: Image to overlay on the sides of tramp
--  - `bounce_rate`: How "bouncy" the tramp is
--
--  @function trampoline.register_tramp
--  @param name
--  @param def
function trampoline.register_tramp(name, def)
	core.register_node("trampoline:" .. name, {
		description = def.description,
		drawtype = "nodebox",
		node_box = box,
		selection_box = box,
		paramtype = "light",
		tiles = {
			"top.png",
			"bottom.png",
			"sides.png^" .. def.overlay,
		},
		groups = {
			dig_immediate = 2,
			bouncy = def.bounce_rate,
			fall_damage_add_percent = -trampoline.damage_absorb,
		},
	})
end
