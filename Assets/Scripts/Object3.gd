extends "res://Assets/Scripts/BaseObject.gd"


func _ready() -> void:
	randomize()
	rotation_degrees.y = randi() % 360
