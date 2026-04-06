extends Area2D
class_name MouseEnterAreaComponent
var in_area = false

signal entered
signal exited


func _on_area_entered(area: Area2D) -> void:
	if area is MouseAreaComponent:
		entered.emit()
		in_area = true

func _on_area_exited(area: Area2D) -> void:
	if area is MouseAreaComponent:
		exited.emit()
		in_area = false
