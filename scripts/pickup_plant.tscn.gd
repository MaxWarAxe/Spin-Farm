extends Area2D
class_name Movable

var G = Vector2.DOWN * 9.8
var velocity = Vector2.ZERO

func _ready() -> void:
	scale = Vector2.ZERO
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2(2.5,2.5),0.3)
	tween.tween_property(self,"scale",Vector2(2,2),0.1)

func _process(delta: float) -> void:
	global_position += velocity*delta
	velocity += G*delta

func _on_pickup_component_picked_up() -> void:
	Global.add_gold(1)
	queue_free()
