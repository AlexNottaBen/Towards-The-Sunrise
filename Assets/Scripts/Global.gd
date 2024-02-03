# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Node

# Declare member variables here. Examples:
const begin_general_speed: float = 80.0

var score: float = 0.0
var score_multiplier: int = 1
var general_speed: float = begin_general_speed
var left_right_speed: int = 50
var is_running: bool = true
var is_paused: bool = false
var is_clear: bool = false

var glider_position: Vector3

func go_to_scene(scene) -> void:
	var _status: int = get_tree().change_scene("res://Assets/Scenes/" + scene + ".tscn")

func clear_scene() -> void:
	is_clear = true

func stop() -> void:
	general_speed = 0
	left_right_speed = 0
	is_running = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	general_speed = 80.0
	left_right_speed = 50
	score_multiplier = 1
	is_running = true
	is_clear = false

func _process(_delta) -> void:
	if is_running and not is_paused:
		score += 0.05 * score_multiplier
		general_speed += 0.01
