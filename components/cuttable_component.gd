extends Area2D
class_name CuttableComponent
@export var collision_shape : CollisionShape2D
signal cutted

func _on_area_entered(area: Area2D) -> void:
	if area is ScytheComponent:
		cutted.emit()
