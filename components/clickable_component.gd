extends Area2D
class_name ClickableComponent
signal clicked
var in_area = false

func on_click():
	clicked.emit()


func _process(delta: float) -> void:
	if !in_area:
		return
	if Input.is_action_just_pressed("click"):
		on_click()

func _on_area_entered(area: Area2D) -> void:
	if area is PickingComponent:
		in_area = true
	



func _on_area_exited(area: Area2D) -> void:
	if area is PickingComponent:
		in_area = false
