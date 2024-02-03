extends Spatial

const animation_speed = 0.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.playback_speed = animation_speed
	$AnimationPlayer.play("Animation")
