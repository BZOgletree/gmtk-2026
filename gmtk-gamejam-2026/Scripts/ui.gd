extends Control

var current_money: int = 0
var current_fish_caught: int = 0

func _ready() -> void:
	Gamestate.spawn_fish.connect(_on_fish_spawn)
	update_shop()
	pass

func _process(delta: float) -> void:
	pass

func _on_fish_spawn(location: int) -> void:
	if current_money != Gamestate.current_money:
		current_money = Gamestate.current_money
		$VBoxContainer/HBoxContainer/Money.text = 'Money Earned: ' + str(current_money)
	if current_fish_caught != Gamestate.total_fish_caught:
		current_fish_caught = Gamestate.total_fish_caught
		$VBoxContainer/HBoxContainer/Fish.text = 'Fish Caught: ' + str(current_fish_caught)
	update_shop()
	pass

func update_shop() -> void:
	print(Gamestate.active_rods[0])
	if Gamestate.active_rods[0] != null:
		$VBoxContainer2/HBoxContainer/Bait.visible = true
		$VBoxContainer2/HBoxContainer/Bait.disabled = (Gamestate.current_money < Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait.text = 'Bait: $' + str(Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait.tooltip_text = 'Decreases the countdown between fish respawns by 1%. Lower cooldown, more fish.'
		$VBoxContainer2/HBoxContainer2/Hook.visible = true
		$VBoxContainer2/HBoxContainer2/Hook.disabled = (Gamestate.current_money < Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook.text = 'Hook: $' + str(Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook.tooltip_text = 'Increase variability in fish weight by 1%. Higher weight, more money.'
		$VBoxContainer2/HBoxContainer3/Line.visible = true
		$VBoxContainer2/HBoxContainer3/Line.disabled = (Gamestate.current_money < Gamestate.active_rods[0].line.cost) 
		$VBoxContainer2/HBoxContainer3/Line.text = 'Line: $' + str(Gamestate.active_rods[0].line.cost)
		$VBoxContainer2/HBoxContainer3/Line.tooltip_text = 'Increase variability in buyer\'s price by 1%. Higher buyer price, more money.'
		$VBoxContainer2/HBoxContainer4/Rod.visible = true
		$VBoxContainer2/HBoxContainer4/Rod.disabled = (Gamestate.current_money < Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod.text = 'Rod: $' + str(Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod.tooltip_text = 'Go to next tier of fish. Higher fish tier, more money.'
		$VBoxContainer2/HBoxContainer5/Sinker.visible = true
		$VBoxContainer2/HBoxContainer5/Sinker.disabled = (Gamestate.current_money < Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker.text = 'Sinker: $' + str(Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker.tooltip_text = 'Decrease tick speed for fish by 1%. Lower tick speed, more fish.'
	else:
		$VBoxContainer2/HBoxContainer/Bait.visible = false
		$VBoxContainer2/HBoxContainer2/Hook.visible = false
		$VBoxContainer2/HBoxContainer3/Line.visible = false
		$VBoxContainer2/HBoxContainer4/Rod.visible = false
		$VBoxContainer2/HBoxContainer5/Sinker.visible = false

	if Gamestate.active_rods[1] != null:
		$VBoxContainer2/HBoxContainer/Bait2.visible = true
		$VBoxContainer2/HBoxContainer/Bait2.disabled = (Gamestate.current_money < Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait2.text = 'Bait: $' + str(Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait2.tooltip_text = 'Decreases the countdown between fish respawns by 1%. Lower cooldown, more fish.'
		$VBoxContainer2/HBoxContainer2/Hook2.visible = true
		$VBoxContainer2/HBoxContainer2/Hook2.disabled = (Gamestate.current_money < Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook2.text = 'Hook: $' + str(Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook2.tooltip_text = 'Increase variability in fish weight by 1%. Higher weight, more money.'
		$VBoxContainer2/HBoxContainer3/Line2.visible = true
		$VBoxContainer2/HBoxContainer3/Line2.disabled = (Gamestate.current_money < Gamestate.active_rods[0].line.cost) 
		$VBoxContainer2/HBoxContainer3/Line2.text = 'Line: $' + str(Gamestate.active_rods[0].line.cost)
		$VBoxContainer2/HBoxContainer3/Line2.tooltip_text = 'Increase variability in buyer\'s price by 1%. Higher buyer price, more money.'
		$VBoxContainer2/HBoxContainer4/Rod2.visible = true
		$VBoxContainer2/HBoxContainer4/Rod2.disabled = (Gamestate.current_money < Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod2.text = 'Rod: $' + str(Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod2.tooltip_text = 'Go to next tier of fish. Higher fish tier, more money.'
		$VBoxContainer2/HBoxContainer5/Sinker2.visible = true
		$VBoxContainer2/HBoxContainer5/Sinker2.disabled = (Gamestate.current_money < Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker2.text = 'Sinker: $' + str(Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker2.tooltip_text = 'Decrease tick speed for fish by 1%. Lower tick speed, more fish.'
	else:
		$VBoxContainer2/HBoxContainer/Bait2.visible = false
		$VBoxContainer2/HBoxContainer2/Hook2.visible = false
		$VBoxContainer2/HBoxContainer3/Line2.visible = false
		$VBoxContainer2/HBoxContainer4/Rod2.visible = false
		$VBoxContainer2/HBoxContainer5/Sinker2.visible = false

	if Gamestate.active_rods[2] != null:
		$VBoxContainer2/HBoxContainer/Bait3.visible = true
		$VBoxContainer2/HBoxContainer/Bait3.disabled = (Gamestate.current_money < Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait3.text = 'Bait: $' + str(Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait3.tooltip_text = 'Decreases the countdown between fish respawns by 1%. Lower cooldown, more fish.'
		$VBoxContainer2/HBoxContainer2/Hook3.visible = true
		$VBoxContainer2/HBoxContainer2/Hook3.disabled = (Gamestate.current_money < Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook3.text = 'Hook: $' + str(Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook3.tooltip_text = 'Increase variability in fish weight by 1%. Higher weight, more money.'
		$VBoxContainer2/HBoxContainer3/Line3.visible = true
		$VBoxContainer2/HBoxContainer3/Line3.disabled = (Gamestate.current_money < Gamestate.active_rods[0].line.cost) 
		$VBoxContainer2/HBoxContainer3/Line3.text = 'Line: $' + str(Gamestate.active_rods[0].line.cost)
		$VBoxContainer2/HBoxContainer3/Line3.tooltip_text = 'Increase variability in buyer\'s price by 1%. Higher buyer price, more money.'
		$VBoxContainer2/HBoxContainer4/Rod3.visible = true
		$VBoxContainer2/HBoxContainer4/Rod3.disabled = (Gamestate.current_money < Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod3.text = 'Rod: $' + str(Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod3.tooltip_text = 'Go to next tier of fish. Higher fish tier, more money.'
		$VBoxContainer2/HBoxContainer5/Sinker3.visible = true
		$VBoxContainer2/HBoxContainer5/Sinker3.disabled = (Gamestate.current_money < Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker3.text = 'Sinker: $' + str(Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker3.tooltip_text = 'Decrease tick speed for fish by 1%. Lower tick speed, more fish.'
	else:
		$VBoxContainer2/HBoxContainer/Bait3.visible = false
		$VBoxContainer2/HBoxContainer2/Hook3.visible = false
		$VBoxContainer2/HBoxContainer3/Line3.visible = false
		$VBoxContainer2/HBoxContainer4/Rod3.visible = false
		$VBoxContainer2/HBoxContainer5/Sinker3.visible = false

	if Gamestate.active_rods[3] != null:
		$VBoxContainer2/HBoxContainer/Bait4.visible = true
		$VBoxContainer2/HBoxContainer/Bait4.disabled = (Gamestate.current_money < Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait4.text = 'Bait: $' + str(Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait4.tooltip_text = 'Decreases the countdown between fish respawns by 1%. Lower cooldown, more fish.'
		$VBoxContainer2/HBoxContainer2/Hook4.visible = true
		$VBoxContainer2/HBoxContainer2/Hook4.disabled = (Gamestate.current_money < Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook4.text = 'Hook: $' + str(Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook4.tooltip_text = 'Increase variability in fish weight by 1%. Higher weight, more money.'
		$VBoxContainer2/HBoxContainer3/Line4.visible = true
		$VBoxContainer2/HBoxContainer3/Line4.disabled = (Gamestate.current_money < Gamestate.active_rods[0].line.cost) 
		$VBoxContainer2/HBoxContainer3/Line4.text = 'Line: $' + str(Gamestate.active_rods[0].line.cost)
		$VBoxContainer2/HBoxContainer3/Line4.tooltip_text = 'Increase variability in buyer\'s price by 1%. Higher buyer price, more money.'
		$VBoxContainer2/HBoxContainer4/Rod4.visible = true
		$VBoxContainer2/HBoxContainer4/Rod4.disabled = (Gamestate.current_money < Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod4.text = 'Rod: $' + str(Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod4.tooltip_text = 'Go to next tier of fish. Higher fish tier, more money.'
		$VBoxContainer2/HBoxContainer5/Sinker4.visible = true
		$VBoxContainer2/HBoxContainer5/Sinker4.disabled = (Gamestate.current_money < Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker4.text = 'Sinker: $' + str(Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker4.tooltip_text = 'Decrease tick speed for fish by 1%. Lower tick speed, more fish.'
	else:
		$VBoxContainer2/HBoxContainer/Bait4.visible = false
		$VBoxContainer2/HBoxContainer2/Hook4.visible = false
		$VBoxContainer2/HBoxContainer3/Line4.visible = false
		$VBoxContainer2/HBoxContainer4/Rod4.visible = false
		$VBoxContainer2/HBoxContainer5/Sinker4.visible = false

	if Gamestate.active_rods[4] != null:
		$VBoxContainer2/HBoxContainer/Bait5.visible = true
		$VBoxContainer2/HBoxContainer/Bait5.disabled = (Gamestate.current_money < Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait5.text = 'Bait: $' + str(Gamestate.active_rods[0].bait.cost)
		$VBoxContainer2/HBoxContainer/Bait5.tooltip_text = 'Decreases the countdown between fish respawns by 1%. Lower cooldown, more fish.'
		$VBoxContainer2/HBoxContainer2/Hook5.visible = true
		$VBoxContainer2/HBoxContainer2/Hook5.disabled = (Gamestate.current_money < Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook5.text = 'Hook: $' + str(Gamestate.active_rods[0].hook.cost)
		$VBoxContainer2/HBoxContainer2/Hook5.tooltip_text = 'Increase variability in fish weight by 1%. Higher weight, more money.'
		$VBoxContainer2/HBoxContainer3/Line5.visible = true
		$VBoxContainer2/HBoxContainer3/Line5.disabled = (Gamestate.current_money < Gamestate.active_rods[0].line.cost) 
		$VBoxContainer2/HBoxContainer3/Line5.text = 'Line: $' + str(Gamestate.active_rods[0].line.cost)
		$VBoxContainer2/HBoxContainer3/Line5.tooltip_text = 'Increase variability in buyer\'s price by 1%. Higher buyer price, more money.'
		$VBoxContainer2/HBoxContainer4/Rod5.visible = true
		$VBoxContainer2/HBoxContainer4/Rod5.disabled = (Gamestate.current_money < Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod5.text = 'Rod: $' + str(Gamestate.active_rods[0].rod.cost)
		$VBoxContainer2/HBoxContainer4/Rod5.tooltip_text = 'Go to next tier of fish. Higher fish tier, more money.'
		$VBoxContainer2/HBoxContainer5/Sinker5.visible = true
		$VBoxContainer2/HBoxContainer5/Sinker5.disabled = (Gamestate.current_money < Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker5.text = 'Sinker: $' + str(Gamestate.active_rods[0].sinker.cost)
		$VBoxContainer2/HBoxContainer5/Sinker5.tooltip_text = 'Decrease tick speed for fish by 1%. Lower tick speed, more fish.'
	else:
		$VBoxContainer2/HBoxContainer/Bait5.visible = false
		$VBoxContainer2/HBoxContainer2/Hook5.visible = false
		$VBoxContainer2/HBoxContainer3/Line5.visible = false
		$VBoxContainer2/HBoxContainer4/Rod5.visible = false
		$VBoxContainer2/HBoxContainer5/Sinker5.visible = false
