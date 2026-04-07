extends Control
@onready var gold_label: Label = $Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var upgrades : Upgrades

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Global.gold_changed.connect(change_gold)
	animation_player.play("shine")

func change_gold():
	var tween_scale = get_tree().create_tween()
	var tween_rotation = get_tree().create_tween()
	#var tween_coin = get_tree().create_tween()
	#tween.tween_property(gold_label,"text",str(Global.gold),0.5)
	tween_scale.tween_property(gold_label,"scale",Vector2(2,2),0.2)
	tween_scale.tween_property(gold_label,"scale",Vector2(1,1),0.5)
	tween_rotation.tween_property(gold_label,"rotation",deg_to_rad(randi_range(-30,30)),0.2)
	tween_rotation.tween_property(gold_label,"rotation",0,0.2)
	animation_player.play("RESET")
	animation_player.play("rotate")
	gold_label.text = str(Global.gold) 


func _on_button_pressed() -> void:
	upgrades.appear()
