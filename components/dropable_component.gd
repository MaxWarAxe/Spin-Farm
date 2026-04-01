extends Node2D
class_name DropableComponent
@export var drop_item : PackedScene

func item_behaviour(instance: Variant):
	instance.global_position = global_position

func drop():
	var instance = drop_item.instantiate()
	item_behaviour(instance)
	call_deferred("add_instance",instance)
func add_instance(instance: Variant):
	get_tree().get_root().add_child(instance)
