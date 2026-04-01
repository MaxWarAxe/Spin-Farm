extends DropableComponent
class_name DropableFlyComponent
@export var speed = 400
@export var spread = 10
var G = Vector2(0,200)

var velocity = Vector2.UP


func item_behaviour(instance: Variant):
	if instance is Movable:
		instance.global_position = global_position
		instance.velocity = velocity.rotated(deg_to_rad(randf_range(-spread,spread)))
		instance.velocity *= speed
		instance.G = G
