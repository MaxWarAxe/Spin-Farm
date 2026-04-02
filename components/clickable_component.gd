extends Area2D
class_name ClickableComponent
signal clicked

func on_click():
	clicked.emit()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			on_click()
		   
