extends "res://Assets/Scripts/BaseObject.gd"

var animation_speed = 1
var begin_animation = false

var glider: Node

func friendly() -> void:
	print("""Objects using this method do not destroy the glider in
	the event of a collision.""")

func _ready() -> void:
	$CollisionShape.transform.origin.x += 15

func _physics_process(_delta):
	if Global.glider_position.y > $CollisionShape.transform.origin.y + 1:
		$CollisionShape.disabled = false
	else:
		$CollisionShape.disabled = true

	if $CollisionShape.transform.origin.x > 0 and begin_animation:
		$CollisionShape.transform.origin.x -= animation_speed

func _on_TriggerArea_body_entered(body) -> void:
	if body.name == "Glider":
		begin_animation = true
