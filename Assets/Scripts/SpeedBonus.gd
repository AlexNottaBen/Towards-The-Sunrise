# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends "res://Assets/Scripts/Bonus.gd"

func _ready() -> void:
	$AnimationPlayer.playback_speed = 0.1
	$AnimationPlayer.play("Rotating")

func bonus(glider) -> void:
	glider.roll()
	$SpeedSound.play()
	Global.general_speed += 20
	Global.score_multiplier += 1
