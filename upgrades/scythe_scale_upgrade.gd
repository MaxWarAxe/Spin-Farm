class_name ScytheScaleUpgrade
extends ScytheUpgrade
@export var scale_percentage: float = 0.1
func upgrade(scythe: Scythe):
	scythe.increace_scale(scale_percentage)
func reset(scythe: Scythe):
	scythe.increace_scale(-scale_percentage)
