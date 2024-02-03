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

# Declare member variables here. Examples:
export var max_lifetime: int = 1200
var lifetime: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Global.is_clear:
		queue_free()
	elif not Global.is_paused:
		lifetime += 1
		if lifetime >= max_lifetime:
			queue_free()
