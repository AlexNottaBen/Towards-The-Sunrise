extends Area

export var max_lifetime: int = 800
var lifetime: int = 0

export var color = Color(0, 255, 237, 0)

func _ready() -> void:
	$AnimationPlayer.playback_speed = 0.1
	$AnimationPlayer.play("Rotating")
	if not $SpeedSound:
		set_color(color)

func _on_Bonus_body_entered(body) -> void:
	if body.name == "Glider":
		bonus(body) # body = Glider
		if Settings.enable_sounds:
			$BonusSound.play()
			visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Global.is_clear:
		queue_free()
	elif not Global.is_paused:
		lifetime += 1
		if lifetime >= max_lifetime:
			queue_free()

func set_color(_color) -> void:
	var new_material = SpatialMaterial.new() # Make a new Spatial Material
	new_material.albedo_color = _color # Set color of new material
	$Pyramid/Model.material_override = new_material # Assign new material to material overrride

func bonus(_glider) -> void:
	Global.score = Global.score + 100
