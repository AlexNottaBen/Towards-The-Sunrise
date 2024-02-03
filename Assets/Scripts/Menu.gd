extends Control


func _on_StartButton_pressed() -> void:
	Global.go_to_scene("CutScene")


func _on_ExitButton_pressed() -> void:
	get_tree().quit()


func _on_CreditsButton_pressed() -> void:
	$CreditsMenu.visible = true


func _on_SettingsButton_pressed() -> void:
	$SettingsMenu.visible = true


func _on_HelpButton_pressed() -> void:
	$HelpMenu.visible = true
