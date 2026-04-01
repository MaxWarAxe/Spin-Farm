extends RigidBody2D

var last_rotation = 0
func _physics_process(delta: float) -> void:
	Global.rotation_velocity = (rotation - last_rotation)*delta
	#print((rotation - last_rotation)*delta)
	last_rotation = rotation
