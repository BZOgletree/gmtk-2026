extends Node
const STARTING_MONEY: int = 0

@export var current_money: int = 0
@export var total_fish_caught: int = 0
@export var active_fish: bool = true
@export var tick_rate: float = 1.0

var _time_elapsed: float = 0.0

signal tick
signal click

func _process(delta: float) -> void:
	_time_elapsed += delta
	if _time_elapsed >= tick_rate:
		_time_elapsed -= tick_rate
		_on_tick()

func _on_tick() -> void:
	tick.emit()
	print('Tick')
