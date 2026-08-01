extends TextureButton

func _pressed():
	disabled = true # Disable the clickability of the button here to prevent workarounds.
	await get_tree().create_timer(0.3).timeout
	$"../CanvasLayer/ColorRect".set_indexed("modulate.a", 0.0) # Properly set invisibility before the tween starts.
	var fade_tween = create_tween() # Create a tween for a part fade-in transition
	fade_tween.tween_property($"../CanvasLayer/ColorRect", "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_LINEAR)
	await fade_tween.finished # Wait until the tween is finished before switching scenes.
	get_tree().change_scene_to_file("res://part1.tscn")
