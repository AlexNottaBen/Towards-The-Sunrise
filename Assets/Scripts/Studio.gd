extends Spatial


func _ready():
	$Background/AnimationPlayer.playback_speed = 5
	$Background/AnimationPlayer.play("Animation")

func _input(event):
	if event.is_action_pressed("Escape"):
		get_tree().quit()
