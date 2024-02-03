extends "res://Assets/Scripts/Bonus.gd"

func _ready() -> void:
	color = Color(253, 255, 0, 0)
	._ready()

func bonus(glider) -> void:
	glider.jump()
