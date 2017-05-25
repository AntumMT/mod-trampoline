-- Craft recipes for trampoline mod


-- Regular trampoline
minetest.register_craft({
	output = "trampoline:trampoline",
	recipe = {
		{"technic:rubber", "technic:rubber", "technic:rubber"},
		{"default:wood", "default:wood", "default:wood"},
		{"default:stick", "default:stick", "default:stick"}
	}
})


-- Brown trampoline
minetest.register_craft({
	output = "trampoline:trampoline_brown",
	recipe = {
		{"technic:rubber", "technic:rubber", "technic:rubber"},
		{"default:junglewood", "default:junglewood", "default:junglewood"},
		{"default:stick", "default:stick", "default:stick"}
	}
})
