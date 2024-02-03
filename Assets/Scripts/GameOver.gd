# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

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
