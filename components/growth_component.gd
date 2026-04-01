extends Node2D
class_name GrowthComponent
@export var growth_time = 5
@export var growth_timer : Timer
signal grown
signal reseted
func _ready() -> void:
	setup_timer()
func setup_timer():
	growth_timer.wait_time = growth_time
	growth_timer.one_shot = true
	growth_timer.start()
	growth_timer.connect("timeout",
		func():
			grown.emit()
	)
func reset():
	reseted.emit()
	growth_timer.start()
