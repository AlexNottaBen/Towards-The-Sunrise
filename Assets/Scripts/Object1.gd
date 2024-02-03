extends "res://Assets/Scripts/BaseObject.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Global.is_paused:
		$AnimationTimer.start()
		randomize()
		rotation.y = rand_range(0, 180)

func _on_AnimationTimer_timeout() -> void:
	if not Global.is_paused:
		$AnimationPlayer.playback_speed = 2
		$AnimationPlayer.play("Falling")

