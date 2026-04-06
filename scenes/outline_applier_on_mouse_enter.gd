extends Node2D
@export var mouse_enter_area : MouseEnterAreaComponent
@export var shader_material : ShaderMaterial
@export var target_node : CanvasItem

func _ready() -> void:
	mouse_enter_area.connect("entered",show_shader)
	mouse_enter_area.connect("exited",hide_shader)
	
func show_shader():
	target_node.material = shader_material
	
func hide_shader():
	target_node.material = null
