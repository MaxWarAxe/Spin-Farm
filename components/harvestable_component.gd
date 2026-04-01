extends Node2D
class_name HarvestableComponent
@export var growth_component : GrowthComponent
@export var cuttable_component : CuttableComponent
@export var dropable_component : DropableComponent
signal harvested
var grown = false

func _ready() -> void:
	growth_component.connect("grown",set_grown)
	cuttable_component.connect("cutted",check_cut)

func set_grown():
	grown = true

func check_cut():
	if grown:
		harvested.emit()
		grown = false
		if dropable_component:
			dropable_component.drop()
		growth_component.reset()
