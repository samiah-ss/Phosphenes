extends TextureButton

func _pressed():
	get_parent().star_found()
	queue_free()
