extends Node2D

@export var location: int = 0

var bait
var hook
var line
var sinker
var rod

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bait = Upgrades.Bait.new('Worms', 0.0, 0, 0)
	hook = Upgrades.Hook.new('Steel Hook', 0.0, 0, 0)
	line = Upgrades.Line.new('Thread', 0.0, 0, 0)
	sinker = Upgrades.Sinker.new('Bobber', 0.0, 0, 0)
	rod = Upgrades.Rod.new('Super Rod', 0, 0, 0)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Gamestate.click.emit(location)
	pass # Replace with function body.
