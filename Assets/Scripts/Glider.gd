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

const broken_glider := preload("res://Assets/Scenes/BrokenGlider.tscn")

# Declare member variables here.
var forward_speed = Global.general_speed
var left_right_speed = Global.left_right_speed
const rotation_speed: float = 0.02

const gravity = 9.807
const mass = 2
var do_jump = false
export var jump_power = 25

var can_fly = true
var allow_control = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Model.visible = true

func disable_control() -> void:
	allow_control = false

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if allow_control and not Global.is_paused:

		Global.glider_position = transform.origin

		if Input.is_action_pressed("Right") and $Model.rotation.z > -0.4:
			$Model.rotation.z -= rotation_speed
		elif Input.is_action_pressed("Left") and $Model.rotation.z < 0.4:
			$Model.rotation.z += rotation_speed
		else:
			if $Model.rotation.z > 0:
				$Model.rotation.z -= 0.01
			else:
				$Model.rotation.z += 0.01

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	if can_fly and not Global.is_paused:
		forward_speed = Global.general_speed
		var velocity := Vector3()
		velocity.z = -forward_speed
		if allow_control:
			if Input.is_action_pressed("Left"):
				velocity.x = -left_right_speed
			elif Input.is_action_pressed("Right"):
				velocity.x = left_right_speed
		if transform.origin.y > 2.4 and not do_jump:
			velocity.y = -gravity * mass
		elif do_jump:
			velocity.y = jump_power
		velocity = move_and_slide(velocity, Vector3.UP)

func drop() -> void:
	var instance_of_broken_glider = broken_glider.instance()
	get_parent().add_child(instance_of_broken_glider)
	instance_of_broken_glider.transform.origin = transform.origin
	instance_of_broken_glider.rotation_degrees = $Model.rotation_degrees

func _on_Area_body_entered(body) -> void:
	if body.name != "Glider" and not body.has_method("friendly"):
		if Settings.enable_sounds:
			$CrashSound.play()
		$CollisionShape.disabled = true
		drop()
		$Area/CollisionShape.disabled = true
		$Model.visible = false
		can_fly = false
		Global.stop()
		$RestartTimer.start()


func roll() -> void:
	$AnimationPlayer.play("Roll")
	$AnimationPlayer.playback_speed = 2

func jump() -> void:
	roll()
	do_jump = true
	$JumpTimer.start()

func _on_RestartTimer_timeout() -> void:
	get_parent().raise_game_over()

func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	if anim_name == "Roll":
		$Model.set_rotation_degrees(Vector3(0, 0, 0))

func _on_JumpTimer_timeout() -> void:
	do_jump = false
