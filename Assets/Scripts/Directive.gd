extends KinematicBody

func _physics_process(_delta) -> void:
	if not Global.is_paused:
		var velocity := Vector3()
		velocity.z = -Global.general_speed
		if Input.is_action_pressed("Left"):
			velocity.x = -Global.left_right_speed
		elif Input.is_action_pressed("Right"):
			velocity.x = Global.left_right_speed
		velocity = move_and_slide(velocity, Vector3.UP)
