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
