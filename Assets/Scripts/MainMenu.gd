extends Spatial


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Settings.enable_music:
		$Music.play()
