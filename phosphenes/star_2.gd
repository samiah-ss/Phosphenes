extends TextureButton

@onready var vl1 = $"/root/Sprite2D/vl2"

func _pressed():
	vl1.modulate.a = 0.0
	vl1.visible = true
	get_parent().star_found()
	var tween: Tween = create_tween()
	tween.tween_property(vl1, "modulate:a", 1.0, 0.5)
	tween.tween_interval(2.0)
	tween.tween_property(vl1, "modulate:a", 0.0, 0.5)
	await tween.finished
	vl1.visible = false
	queue_free()
