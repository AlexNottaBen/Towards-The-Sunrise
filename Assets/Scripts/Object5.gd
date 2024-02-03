# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends "res://Assets/Scripts/BaseObject.gd"

func _ready() -> void:
	transform.origin.y -= 0.75

func _on_AnimationTimer_timeout() -> void:
	if not Global.is_paused:
		$AnimationPlayer.playback_speed = 2
		$AnimationPlayer.play("Roll")
		transform.origin.y -= 0.75
