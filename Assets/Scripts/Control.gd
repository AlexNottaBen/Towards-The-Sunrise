extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScoreLabel.text = str(0)

func _process(_delta) -> void:
	$ScoreLabel.text = str(round(Global.score))
	$ScoreMultiplierLabel.text = " x" + str(Global.score_multiplier)
