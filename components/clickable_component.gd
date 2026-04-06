extends MouseEnterAreaComponent
class_name ClickableComponent
signal clicked

func on_click():
	clicked.emit()


func _process(delta: float) -> void:
	if !in_area:
		return
	if Input.is_action_just_pressed("click"):
		on_click()
