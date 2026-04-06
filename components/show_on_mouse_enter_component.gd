extends Node2D
@export var node : Control
@export var show_time = 0.3

func _ready() -> void:
	modulate.a = 0
	node.connect("mouse_entered",show_tween)
	node.connect("mouse_exited",hide_tween)
func show_tween():
	print("dd")
	var tween = get_tree().create_tween()
	tween.tween_property(node,"modulate.a",255,show_time)
	
func hide_tween():
	var tween = get_tree().create_tween()
	tween.tween_property(node,"modulate.a",0,show_time)
