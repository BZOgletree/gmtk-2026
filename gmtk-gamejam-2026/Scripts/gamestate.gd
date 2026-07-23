extends Node

@export var current_money: int = 0
@export var total_fish_caught: int = 0
@export var tick_rate: float = 1.0
@export var active_rods = {
	0: {},
	1: {},
	2: {},
	3: {},
	4: {}
}
@export var active_fish = {
	0: true,
	1: false,
	2: false,
	3: false,
	4: false
}
const global_positions_for_each_location = {
	0: {
		"rod": {
			x = -420,
			y = 250
		},
		"fish": {
			x = -420,
			y = -125
		}
	},
	1: {
		"rod": {
			x = -210,
			y = 250
		},
		"fish": {
			x = -210,
			y = -125
		}
	},
	2: {
		"rod": {
			x = 0,
			y = 250
		},
		"fish": {
			x = 0,
			y = -125
		}
	},
	3: {
		"rod": {
			x = 210,
			y = 250
		},
		"fish": {
			x = 210,
			y = -125
		}
	},
	4: {
		"rod": {
			x = 420,
			y = 250
		},
		"fish": {
			x = 420,
			y = -125
		}
	}
}

var _time_elapsed: float = 0.0

signal tick
signal click(location: int)
signal spawn_fish(location: int)

func _process(delta: float) -> void:
	_time_elapsed += delta
	if _time_elapsed >= tick_rate:
		_time_elapsed -= tick_rate
		_on_tick()

func _on_tick() -> void:
	tick.emit()
	print('Tick')
