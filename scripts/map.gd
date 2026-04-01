extends Node2D
@export var rigid_object_cursor : PhysicsBody2D
@onready var progress_bar: ProgressBar = $ProgressBar

func _process(delta: float) -> void:
	progress_bar.value = Global.rotation_velocity * 10000

func _physics_process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	rigid_object_cursor.global_position = mouse_position
	
