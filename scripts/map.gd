extends Node2D
@export var rigid_object_cursor : PhysicsBody2D
@export var picking_component : PickingComponent
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var camera: Camera2D = $Camera


func _process(delta: float) -> void:
	progress_bar.value = Global.rotation_velocity * 10000
	if Input.is_action_just_pressed("ui_right"):
		camera.zoom += Vector2(-0.5,-0.5)
	if Input.is_action_just_pressed("ui_left"):
		camera.zoom -= Vector2(-0.5,-0.5)	
	
func _physics_process(delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	rigid_object_cursor.global_position = mouse_position
	picking_component.global_position = mouse_position
