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

const left_right_speed: float = 0.75
var switch_direction: bool = false

func _physics_process(_delta) -> void:
	if not Global.is_paused:
		if switch_direction:
			transform.origin.x += left_right_speed
		else:
			transform.origin.x -= left_right_speed

func _on_DirectionTimer_timeout() -> void:
	switch_direction = !switch_direction
