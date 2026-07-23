class_name Fish
extends Node2D

@export var worth_at_shop: int = 0
@export var name_of_fish: String
@export var level_required_for_fish: int = 0
@export var cooldown_for_fish: float = 0.0
@export var location: int

@export var base_level_fishes = {
	0: {"respawn": 5, "base_money": 1, "base_timer": 15},
	1: {"respawn": 10, "base_money": 2, "base_timer": 30},
	2: {"respawn": 25, "base_money": 5, "base_timer": 75},
	3: {"respawn": 50, "base_money": 10, "base_timer": 150},
	4: {"respawn": 100, "base_money": 20, "base_timer": 300}
}

func _ready():
	Gamestate.tick.connect(_on_tick)
	Gamestate.click.connect(_on_click)

func _on_tick() -> void:
	cooldown_for_fish -= 1
	$Label.text = str(int(cooldown_for_fish))
	if cooldown_for_fish == 0.0:
		caught(location)

func _on_click(click_location) -> void:
	if click_location == location:
		cooldown_for_fish -= 1
		$Label.text = str(int(cooldown_for_fish))
		if cooldown_for_fish == 0.0:
			caught(location)

func caught(location: int) -> void:
	Gamestate.current_money += worth_at_shop
	Gamestate.total_fish_caught += 1
	self.visible = false
	await get_tree().create_timer(1.0).timeout
	Gamestate.active_fish[location] = false
	Gamestate.spawn_fish.emit(location)
	self.queue_free()
