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


func _ready():
	$Background/AnimationPlayer.playback_speed = 5
	$Background/AnimationPlayer.play("Animation")

func _input(event):
	if event.is_action_pressed("Escape"):
		get_tree().quit()
