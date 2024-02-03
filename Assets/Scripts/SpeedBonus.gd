extends "res://Assets/Scripts/Bonus.gd"

func _ready() -> void:
	$AnimationPlayer.playback_speed = 0.1
	$AnimationPlayer.play("Rotating")

func bonus(glider) -> void:
	glider.roll()
	$SpeedSound.play()
	Global.general_speed += 20
	Global.score_multiplier += 1
