extends Node

class Upgrade extends Node2D:
	var upgrade_name: String
	var type: String
	var cost: int
	var upgrade_hot_spot: int
	var base_price: int
	var price_increase_amount: float

	func _init(name: String, upgrade_type: String, upgrade_cost: int, location: int) -> void:
		upgrade_name = name
		type = upgrade_type
		cost = upgrade_cost
		upgrade_hot_spot = location



class Bait extends Upgrade:
	var lower_cooldown: float

	func _init(name: String, decrease_percent: float, bait_cost: int, location: int) -> void:
		super._init(name, 'Bait', bait_cost, location)
		lower_cooldown = decrease_percent
		base_price = 1 * location if location > 1 else 1 + location
		price_increase_amount = 1.25



class Rod extends Upgrade:
	var rod_level: int

	func _init(name: String, level: int, rod_cost: int, location: int) -> void:
		super._init(name, 'Rod', rod_cost, location)
		rod_level = level
		base_price = 100 * location if location > 1 else 100 + (location * 100)
		price_increase_amount = 10.0



class Hook extends Upgrade:
	var random_increase: float

	func _init(name: String, increase_percent: float, hook_cost: int, location: int) -> void:
		super._init(name, 'Hook', hook_cost, location)
		random_increase = increase_percent
		base_price = 5 * location if location > 1 else 5 + (location * 5)
		price_increase_amount = 1.25



class Line extends Upgrade:
	var random_multiplier: float

	func _init(name: String, multiplier_increase: float, line_cost: int, location: int) -> void:
		super._init(name, 'Line', line_cost, location)
		random_multiplier = multiplier_increase
		base_price = 20 * location if location > 1 else 20 + (location * 20)
		price_increase_amount = 1.25
		



class Sinker extends Upgrade:
	var decrease_tick_speed: float

	func _init(name: String, tick_speed: float, sinker_cost: int, location: int) -> void:
		super._init(name, 'Sinker', sinker_cost, location)
		decrease_tick_speed = tick_speed
		base_price = 10 * location if location > 1 else 10 + (location * 10)
		price_increase_amount = 1.25
