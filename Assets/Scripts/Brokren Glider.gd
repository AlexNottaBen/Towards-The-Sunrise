extends RigidBody

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var velocity := Vector3()
	velocity.z = -80
	apply_impulse(velocity, Vector3.UP)
