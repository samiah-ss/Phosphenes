extends TextureButton

@onready var vl3 = $"/root/Sprite2D/vl3" # Fetch the dialogue as a variable.

func _pressed():
	disabled = true # Disable the clickability of the button here to prevent workarounds.
	vl3.modulate.a = 0.0 # Start without transparency.
	vl3.visible = true # Make dialogue visible.
	get_parent().star_found() # Get and run the star_found function from the parent object.
	var tween: Tween = create_tween() # Create a new tween effect.
	tween.tween_property(vl3, "modulate:a", 1.0, 0.5) # Incorporate a 0.5-second fade-in.
	tween.tween_interval(2.0) # Pause tweening effects for a 2-second readability window.
	tween.tween_property(vl3, "modulate:a", 0.0, 0.5) # Incorporate a 0.5-second fade-out.
	await tween.finished # Mark tweening as finished.
	vl3.visible = false # Undo dialogue visibility.
	queue_free() # Delete the star sprite.
