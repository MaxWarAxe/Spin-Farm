extends Control
class_name UpgradeButton
@export var upgrade_description : String
@onready var animation_player_desc: AnimationPlayer = $AnimationPlayerDesc
@onready var animation_player_cost: AnimationPlayer = $AnimationPlayerCost
@export var sound_spawner : SoundSpawner
@export var max_progress : int
var current_progress : int = 0
@export var cost : int = 20
@export var cost_increment : int = 20
@export var upgrade : Upgrade
@onready var cur_progres_label: Label = $Panel/HSplitContainer/cur_progres_label
@onready var max_progres_label: Label = $Panel/HSplitContainer/max_progres_label
@onready var progress_bar: Sprite2D = $ProgressBar
@onready var cost_label: Label = $CostLabel/CostLabel
@onready var rich_text_label: RichTextLabel = $Panel/RichTextLabel
@onready var cost_sprite: Sprite2D = $CostLabel


func _on_button_mouse_entered() -> void:
	animation_player_desc.play("desc_show")
	animation_player_cost.play("cost/cost_shows")

func _on_button_mouse_exited() -> void:
	animation_player_desc.play("desc_hide")
	animation_player_cost.play("cost/cost_hide")

func check_buy():
	if Global.gold >= cost and current_progress < max_progress:
		sound_spawner.play()
		Global.add_gold(-cost)
		if upgrade:
			upgrade.append()
		strategy_after_buy()
		change_ui()
func _ready() -> void:
	rich_text_label.text = upgrade_description
	change_ui()

func change_ui():
	cur_progres_label.text = str(current_progress)
	max_progres_label.text = str(max_progress)
	cost_label.text = str(cost)
	animation_player_cost.play("cost/cost_shows")
	if current_progress == max_progress:
		cost_sprite.visible = false
	progress_bar.set_instance_shader_parameter("progress",float(current_progress)/float(max_progress))

func strategy_after_buy():
	if current_progress < max_progress:
		current_progress += 1
		cost += cost_increment

func _on_button_pressed() -> void:
	check_buy()
	
