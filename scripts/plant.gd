extends Node2D
class_name Plant
@export var growth_component : GrowthComponent


func _ready() -> void:
	Global.append_plant(self)
