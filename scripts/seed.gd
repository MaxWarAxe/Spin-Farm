extends Node2D
@export var clickable_component : ClickableComponent
@export var cost : int = 20
@export var plant : PackedScene
signal bought
signal planted_on_position

func set_cost_label():
	$View/CostLabel/Label.text = str(cost)
	
func _ready() -> void:
	set_cost_label()
	clickable_component.connect("clicked",buy)
	
func buy():
	print("bought")
	if Global.gold >= cost:
		bought.emit()
		planted_on_position.emit(global_position)
		queue_free()
		plant_seed()
		Global.add_gold(-cost)
func plant_seed():
	var instance = plant.instantiate()
	instance.global_position = global_position
	get_parent().add_child(instance)
