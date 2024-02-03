extends Camera

const speed: float = 0.025

func _physics_process(_delta) -> void:
	if transform.origin.y < 70:
		transform.origin.y += speed
