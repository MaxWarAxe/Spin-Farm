extends Node
var rotation_velocity
var gold = 0
signal gold_changed

var plants : Array[Plant]

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	#add_gold(11111)

func add_gold(value : int):
	gold += value
	gold_changed.emit()

func append_plant(plant : Plant):
	plants.append(plant)
