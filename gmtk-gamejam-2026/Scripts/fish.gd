class_name Fish
extends Node2D

@export var worth_at_shop: int = 0
@export var name_of_fish: String
@export var level_required_for_fish: int = 0
@export var cooldown_for_fish: float = 0.0

func _ready():
	Gamestate.tick.connect(_on_tick)
	Gamestate.click.connect(_on_click)

func _on_tick() -> void:
	cooldown_for_fish -= 1
	$Label.text = str(int(cooldown_for_fish))
	if cooldown_for_fish == 0.0:
		caught()

func _on_click() -> void:
	cooldown_for_fish -= 1
	$Label.text = str(int(cooldown_for_fish))
	if cooldown_for_fish == 0.0:
		caught()

func caught() -> void:
	Gamestate.current_money += worth_at_shop
	Gamestate.total_fish_caught += 1
	self.visible = false
	await get_tree().create_timer(1.0).timeout
	Gamestate.active_fish = false
	self.queue_free()
