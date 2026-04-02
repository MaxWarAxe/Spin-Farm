extends RigidBody2D
@export var start_scale : float = 2
@export var pivot_point : Marker2D
@export var pin_joint : PinJoint2D

var last_rotation = 0
func _physics_process(delta: float) -> void:
	#pin_joint.global_position = pivot_point.global_position
	Global.rotation_velocity = (rotation - last_rotation)*delta
	#print((rotation - last_rotation)*delta)
	last_rotation = rotation
func change_scale(scale_mul):
	for child in get_children():
		child.scale.x = child.scale.x * scale_mul
		child.scale.y = child.scale.y * scale_mul
func _ready():
	change_scale(start_scale)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		change_scale(scale.x + start_scale*0.1)
	if Input.is_action_just_pressed("ui_down"):
		change_scale(scale.x - start_scale*0.1)
