extends AnimationPlayer
@export var mouse_enter_area_component : MouseEnterAreaComponent

func _ready() -> void:
	
	mouse_enter_area_component.connect("entered",cost_shows)
	mouse_enter_area_component.connect("exited",cost_hide)
func cost_shows():
	play("cost_shows")
func cost_hide():
	play("cost_hide")
