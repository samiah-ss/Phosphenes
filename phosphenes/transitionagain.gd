extends CanvasLayer

func _ready(): # On ready, the player should not be able to see the ColorRect.
	$ColorRect.modulate.a = 0.0
