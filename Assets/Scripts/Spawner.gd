extends "res://Assets/Scripts/Directive.gd"

# Declare member variables here.
var countdown: int = 0

# Types
const objects_qty: int = 6
const structures_qty: int = 4
const bonus_qty: int = 3

var bodies_qty: int # qty for spawn
var spawn_area_size: Vector3

func _ready() -> void:
	bodies_qty = Settings.bodies_qty
	spawn_area_size = Vector3(Settings.spawn_area_size, 0, Settings.spawn_area_size)
	randomize()
	countdown = int(rand_range(10, 100))

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if not Global.is_paused:
		countdown -= 1
		if countdown <= 0:
			for _i in range(bodies_qty):
				randomize()
				countdown = int(rand_range(50, 100))
				var choose = int(rand_range(0, objects_qty))
				var instance_of_new_object
				if choose == 0:
					# Add structure
					var choose_structure = int(rand_range(0, structures_qty))
					if choose_structure == 0:
						var choose_bonus = int(rand_range(0, bonus_qty) + 1)
						var path_to_bonus_scene = "res://Assets/Scenes/Bonus" + str(choose_bonus) + ".tscn"
						instance_of_new_object = load(path_to_bonus_scene).instance()
					else:
						var path_to_structure_scene = "res://Assets/Scenes/Structure" + str(choose_structure) + ".tscn"
						instance_of_new_object = load(path_to_structure_scene).instance()
				else:
					# Add just object
					var path_to_object_scene = "res://Assets/Scenes/Object" + str(choose) + ".tscn"
					instance_of_new_object = load(path_to_object_scene).instance()

				get_parent().get_parent().get_parent().add_child(instance_of_new_object)

				var pos_x: float = rand_range(-spawn_area_size.x/2, spawn_area_size.x/2)
				var pos_y: float = 1.0
				var pos_z: float = rand_range(-spawn_area_size.z/2, spawn_area_size.z/2)

				instance_of_new_object.transform.origin = Vector3(transform.origin.x + pos_x, pos_y, transform.origin.z +  pos_z)
