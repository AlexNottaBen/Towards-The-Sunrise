extends "res://Assets/Scripts/BaseObject.gd"

const speed = 0.05

func _physics_process(_delta) -> void:
	$Model/Sphere.rotate_z(speed)
