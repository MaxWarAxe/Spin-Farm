extends PlantUpgrade
class_name GrowthTimePlantUpgrade
@export var growth_time : float = 0.4
func upgrade(target: Plant):
	target.growth_component.growth_time -= growth_time
func reset(target: Plant):
	target.growth_component.growth_time += growth_time
