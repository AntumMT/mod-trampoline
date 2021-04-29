-- Nodes registration for trampoline mod


-- Regular trampoline
trampoline.register_tramp("regular", {
	description = "Trampoline",
	overlay = "sides_overlay.png",
	bounce_rate = trampoline.bounce * trampoline.multi_high,
})

-- Brown trampoline (bounces higher than regular tramp)
trampoline.register_tramp("brown", {
	description = "Brown Trampoline",
	overlay = "sides_overlay_brown.png",
	bounce_rate = trampoline.bounce * trampoline.multi_high,
})


-- Aliases for trampoline mod

local aliases = {
	"trampoline:trampoline",
	"trampoline:tramp",
	"trampoline",
	"tramp",
}

for I in pairs(aliases) do
	minetest.register_alias(aliases[I], "trampoline:regular")
end


local aliases_brown = {
	"trampoline:trampoline_brown",
	"trampoline:tramp_brown",
	"trampoline_brown",
	"tramp_brown",
	"brown_trampoline",
	"brown_tramp",
}

for I in pairs(aliases_brown) do
	minetest.register_alias(aliases_brown[I], "trampoline:brown")
end
