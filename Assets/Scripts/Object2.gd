extends "res://Assets/Scripts/BaseObject.gd"

const left_right_speed: float = 0.75
var switch_direction: bool = false 

func _physics_process(_delta) -> void:
	if not Global.is_paused:
		if switch_direction:
			transform.origin.x += left_right_speed
		else:
			transform.origin.x -= left_right_speed

func _on_DirectionTimer_timeout() -> void:
	switch_direction = !switch_direction
