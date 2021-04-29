-- Nodes registration for trampoline mod


-- Regular trampoline
trampoline.register_tramp("regular", {
	description = "Trampoline",
	overlay = "sides_overlay.png",
	bounce_rate = trampoline.bounce * trampoline.multi,
})

-- Brown trampoline (bounces higher than regular tramp)
trampoline.register_tramp("brown", {
	description = "Brown Trampoline",
	overlay = "sides_overlay_brown.png",
	bounce_rate = trampoline.bounce * trampoline.multi_brown,
})
