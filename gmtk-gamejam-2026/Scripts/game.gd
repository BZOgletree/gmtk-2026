extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Gamestate.active_fish:
		Gamestate.active_fish = true
		spawn_fish()
	pass

func spawn_fish() -> void:
	var fish = preload("res://Scenes/fish.tscn").instantiate()
	fish.cooldown_for_fish = 15.0
	fish.worth_at_shop = 1
	fish.name_of_fish = 'Basic Bitch'
	fish.level_required_for_fish = 0
	add_child(fish)
	fish.global_position.x = -200
	fish.global_position.y = -250
