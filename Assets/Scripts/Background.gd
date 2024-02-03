extends Spatial

const animation_speed = 0.1
var animation_played: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.playback_speed = animation_speed

func _physics_process(_delta) -> void:
	if Global.is_paused:
		if animation_played:
			$AnimationPlayer.stop(false)  # reset=false
			animation_played = false
	else:
		if not animation_played:
			$AnimationPlayer.play("Animation")
			animation_played = true
