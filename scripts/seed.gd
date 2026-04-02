extends Node2D
@export var clickable_component : ClickableComponent
@export var cost : int = 20
@export var plant : PackedScene

func _ready() -> void:
	clickable_component.connect("clicked",buy)
	
func buy():
	print("bought")
	if Global.gold >= cost:
		queue_free()
		plant_seed()
		Global.add_gold(-cost)
func plant_seed():
	var instance = plant.instantiate()
	instance.global_position = global_position
	get_tree().get_root().add_child(instance)
