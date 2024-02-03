extends Spatial

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control/WindowDialog/ScoreLabel.text = "Score: " + str(round(Global.score))
	if Settings.enable_music:
		$Music.play()

func _on_StopButton_pressed() -> void:
	Global.go_to_scene("Menu")

func _on_RestartButton_pressed() -> void:
	Global.go_to_scene("CutScene")
