# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends KinematicBody

func _physics_process(_delta) -> void:
	if not Global.is_paused:
		var velocity := Vector3()
		velocity.z = -Global.general_speed
		if Input.is_action_pressed("Left"):
			velocity.x = -Global.left_right_speed
		elif Input.is_action_pressed("Right"):
			velocity.x = Global.left_right_speed
		velocity = move_and_slide(velocity, Vector3.UP)
