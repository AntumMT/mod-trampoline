-- Aliases for trampoline mod


local aliases = {
	'trampoline:tramp',
	'trampoline',
	'tramp'
}

for I in pairs(aliases) do
	minetest.register_alias(aliases[I], 'trampoline:trampoline')
end


local aliases_brown = {
	'trampoline:tramp_brown',
	'trampoline_brown',
	'tramp_brown',
	'brown_trampoline',
	'brown_tramp',
}

for I in pairs(aliases_brown) do
	minetest.register_alias(aliases_brown[I], 'trampoline:trampoline_brown')
end
