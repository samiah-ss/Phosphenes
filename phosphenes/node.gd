extends Node

@onready var label1 = $"/root/Sprite2D/GameManager/onestartext"
@onready var label2 = $"/root/Sprite2D/GameManager/twostartext"
@onready var label3 = $"/root/Sprite2D/GameManager/threestartext"

var stars_found = 0

func star_found():
	stars_found+=1
	update_labels()

func update_labels():
	if stars_found >= 1:
		label1.modulate = Color.BLACK
	if stars_found >= 2:
		label2.modulate = Color.BLACK
	if stars_found >= 3:
		label3.modulate = Color.BLACK
