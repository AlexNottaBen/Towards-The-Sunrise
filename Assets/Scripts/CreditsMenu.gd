extends Control

func _on_CloseButton_pressed() -> void:
	visible = false

func _input(event) -> void:
	if event.is_action_pressed("Escape"):
		visible = false
