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
