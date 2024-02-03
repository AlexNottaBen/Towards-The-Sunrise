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
