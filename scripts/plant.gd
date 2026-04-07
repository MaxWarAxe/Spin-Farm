extends Node2D
class_name Plant

func _ready() -> void:
	Global.append_plant(self)
