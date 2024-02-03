extends Control

func _ready() -> void:
	$WindowDialog/VBoxContainer/MusicCheckButton.pressed = Settings.enable_music
	$WindowDialog/VBoxContainer/SoundsCheckButton.pressed = Settings.enable_sounds
	$WindowDialog/RadiusSpawnAmountLabel/RadiusSpawnAmountInput.text = str(Settings.spawn_area_size)
	$WindowDialog/ObjectsSpawnQuantityLabel/ObjectsSpawnQuantitInput.text = str(Settings.bodies_qty)

func _on_ApplyButton_pressed() -> void:
	visible = false

func _on_MusicCheckButton_toggled(button_pressed) -> void:
	Settings.enable_music = button_pressed
	if get_parent().name == "InGame":
		if Settings.enable_music:
			get_parent().get_node("Music").play()
		else:
			get_parent().get_node("Music").stop()
	elif get_parent().name == "Menu":
		if Settings.enable_music:
			get_parent().get_parent().get_node("Music").play()
		else:
			get_parent().get_parent().get_node("Music").stop()

func _on_SoundsCheckButton_toggled(button_pressed) -> void:
	Settings.enable_sounds = button_pressed

func _input(event) -> void:
	if event.is_action_pressed("Escape"):
		visible = false

func _on_RadiusSpawnAmountInput_text_changed() -> void:
	Settings.spawn_area_size = abs(float($WindowDialog/RadiusSpawnAmountLabel/RadiusSpawnAmountInput.text))

func _on_ObjectsSpawnQuantitInput_text_changed() -> void:
	Settings.bodies_qty = abs(int($WindowDialog/ObjectsSpawnQuantityLabel/ObjectsSpawnQuantitInput.text))
