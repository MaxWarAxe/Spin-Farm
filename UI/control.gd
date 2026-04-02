extends Control
@onready var gold_label: Label = $Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	Global.gold_changed.connect(change_gold)
	animation_player.play("shine")

func change_gold():
	var tween_scale = get_tree().create_tween()
	var tween_rotation = get_tree().create_tween()
	#tween.tween_property(gold_label,"text",str(Global.gold),0.5)
	tween_scale.tween_property(gold_label,"scale",Vector2(2,2),0.2)
	tween_scale.tween_property(gold_label,"scale",Vector2(1,1),0.5)
	tween_rotation.tween_property(gold_label,"rotation",deg_to_rad(randi_range(-30,30)),0.2)
	tween_rotation.tween_property(gold_label,"rotation",0,0.2)
	gold_label.text = str(Global.gold) 
