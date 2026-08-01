extends Node

# Set different labels to variables.
@onready var label1 = $"/root/Sprite2D/GameManager/onestartext"
@onready var label2 = $"/root/Sprite2D/GameManager/twostartext"
@onready var label3 = $"/root/Sprite2D/GameManager/threestartext"

var stars_found = 0 # Initialize a lack of found stars.

func _ready(): # On ready, the player should not be able to see the ColorRect.
	$CanvasLayer/ColorRect.modulate.a = 0.0

# Update levels once star count increases.
func star_found():
	stars_found+=1
	update_labels()

# Update labels by turning them black according to the total amount of found stars.
func update_labels():
	if stars_found >= 1:
		label1.modulate = Color.BLACK
	if stars_found >= 2:
		label2.modulate = Color.BLACK
	if stars_found >= 3:
		label3.modulate = Color.BLACK
		await get_tree().create_timer(3).timeout
		$CanvasLayer/ColorRect.modulate.a = 0.0
		var fade_tween = create_tween() # Create a tween for a part fade-in transition
		fade_tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 1.0, 1.0,).set_trans(Tween.TRANS_LINEAR)
		await fade_tween.finished # Wait until the tween is finished before switching scenes.
		get_tree().change_scene_to_file("res://part2.tscn")
