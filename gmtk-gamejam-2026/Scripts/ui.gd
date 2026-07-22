extends Control

var current_money: int = 0
var current_fish_caught: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_money != Gamestate.current_money:
		current_money = Gamestate.current_money
		$VBoxContainer/HBoxContainer/Money.text = 'Money Earned: ' + str(current_money)
	if current_fish_caught != Gamestate.total_fish_caught:
		current_fish_caught = Gamestate.total_fish_caught
		$VBoxContainer/HBoxContainer/Fish.text = 'Fish Caught: ' + str(current_fish_caught)
	pass
