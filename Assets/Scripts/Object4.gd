extends "res://Assets/Scripts/BaseObject.gd"

var begin_build: bool = false

func _ready() -> void:
	$CollisionShape.transform.origin.y = -25
	if not Global.is_paused:
		$BuildTimer.wait_time = abs(transform.origin.z) / 3
		$BuildTimer.start()

func _on_BuildTimer_timeout() -> void:
	begin_build = true

func _physics_process(_delta) -> void:
	if not Global.is_paused and begin_build and $CollisionShape.transform.origin.y < 39:
		$CollisionShape.transform.origin.y += 1
