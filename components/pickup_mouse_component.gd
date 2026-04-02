extends PickupComponent
class_name PickupMouseComponent





func _on_area_entered(area: Area2D) -> void:
	if area is PickingComponent:
		pickup()
