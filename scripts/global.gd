extends Node
var rotation_velocity
var gold = 0
signal gold_changed

func add_gold(value : int):
	gold += value
	gold_changed.emit()
