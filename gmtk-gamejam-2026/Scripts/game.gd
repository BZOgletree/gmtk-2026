extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gamestate.spawn_fish.connect(_on_spawn_fish)
	var starting_rod = preload("res://Scenes/fishing_rod.tscn").instantiate()
	starting_rod.location = 0
	add_child(starting_rod)
	starting_rod.global_position = Vector2(Gamestate.global_positions_for_each_location[0]["rod"].x, Gamestate.global_positions_for_each_location[0]["rod"].y)
	Gamestate.active_rods[0] = starting_rod
	_on_spawn_fish(0)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in Gamestate.active_rods.size():
		if not Gamestate.active_fish[i] and "rod" in Gamestate.active_rods[i]:
			print("Spawning fihs")
			Gamestate.active_fish[i] = true
			_on_spawn_fish(i)
	pass

func _on_spawn_fish(location: int) -> void:
	var fish = preload("res://Scenes/fish.tscn").instantiate()
	fish.cooldown_for_fish = fish.base_level_fishes[Gamestate.active_rods[0].rod.rod_level].base_timer
	fish.worth_at_shop = fish.base_level_fishes[Gamestate.active_rods[0].rod.rod_level].base_money
	add_child(fish)
	fish.global_position = Vector2(Gamestate.global_positions_for_each_location[location]["fish"].x, Gamestate.global_positions_for_each_location[location]["fish"].y)
	fish.scale = Vector2(.5, .5)
