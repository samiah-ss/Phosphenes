extends TextureButton

@onready var vl5 = $"/root/Sprite2D/vl5" # Fetch the dialogue as a variable.

func _pressed():
	disabled = true # Disable the clickability of the button here to prevent workarounds.
	vl5.modulate.a = 0.0 # Start without transparency.
	vl5.visible = true # Make dialogue visible.
	get_parent().star_found() # Get and run the star_found function from the parent object.
	var tween: Tween = create_tween() # Create a new tween effect.
	tween.tween_property(vl5, "modulate:a", 1.0, 0.5) # Incorporate a 0.5-second fade-in.
	tween.tween_interval(5.0) # Pause tweening effects for a 5-second readability window.
	tween.tween_property(vl5, "modulate:a", 0.0, 0.5) # Incorporate a 0.5-second fade-out.
	await tween.finished # Mark tweening as finished.
	vl5.visible = false # Undo dialogue visibility.
	queue_free() # Delete the star sprite.
