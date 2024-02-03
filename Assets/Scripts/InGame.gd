extends Spatial

var is_sunrise_begin: bool = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$DirectionalLight.visible = false
	$DirectionalLight.rotation_degrees.x = -180
	if Settings.enable_music:
		$Music.play()

func raise_game_over() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	for child in get_children():
		child.queue_free()

	Global.clear_scene()
	Global.go_to_scene("GameOver")

func _input(event) -> void:
	if event.is_action_pressed("Escape") and $Glider.can_fly:
		$InGameMenu.toggle_visibility()

func _on_SunRiseTimer_timeout() -> void:
	$DirectionalLight.visible = true
	is_sunrise_begin = true

func _process(_delta) -> void:
	if is_sunrise_begin and $DirectionalLight.rotation_degrees.x < -178:
		$DirectionalLight.rotation_degrees.x += 0.01
