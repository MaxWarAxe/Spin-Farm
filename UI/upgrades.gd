extends Control
class_name Upgrades

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_button_pressed() -> void:
	disapear()

func appear():
	visible = true
	get_tree().paused = true
	
func disapear():
	visible = false
	get_tree().paused = false
