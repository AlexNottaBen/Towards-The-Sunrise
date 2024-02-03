# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Control

func toggle_visibility() -> void:
	Global.is_paused = !Global.is_paused
	visible = !visible
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_parent().get_node("SunRiseTimer").paused = !get_parent().get_node("SunRiseTimer").paused


func _on_ContinueButton_pressed() -> void:
	toggle_visibility()


func _on_RestartButton_pressed() -> void:
	toggle_visibility()
	Global.go_to_scene("CutScene")


func _on_SettingsButton_pressed() -> void:
	get_parent().get_node("SettingsMenu").visible = true


func _on_StopButton_pressed() -> void:
	toggle_visibility()
	Global.go_to_scene("Menu")


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
