extends Area2D
class_name Movable

var G = Vector2.DOWN * 9.8
var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	global_position += velocity*delta
	velocity += G*delta

func _on_pickup_component_picked_up() -> void:
	Global.add_gold(1)
	queue_free()
