extends "res://Assets/Scripts/BaseObject.gd"

func _ready() -> void:
	transform.origin.y -= 0.75

func _on_AnimationTimer_timeout() -> void:
	if not Global.is_paused:
		$AnimationPlayer.playback_speed = 2
		$AnimationPlayer.play("Roll")
		transform.origin.y -= 0.75
