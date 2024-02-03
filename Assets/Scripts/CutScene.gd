extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global._ready()
	Global.is_paused = false
	$Glider.disable_control()
	$Timer.start()
	$SoundTimer.start()

func _on_Timer_timeout() -> void:
	Global.go_to_scene("InGame")

func _on_SoundTimer_timeout() -> void:
	if Settings.enable_sounds:
		$Sound.play()
