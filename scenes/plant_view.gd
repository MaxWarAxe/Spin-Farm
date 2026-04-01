extends Node2D
class_name PlantView
@export var animated_sprite : AnimatedSprite2D
@export var growth_component : GrowthComponent
@export var particles : GPUParticles2D
@onready var max_frames
var frames_amount

func _ready() -> void:
	growth_component.connect("reseted",cutted)
	frames_amount = animated_sprite.sprite_frames.get_frame_count(animated_sprite.animation)
	start_grow()

func cutted():
	particles.emitting = true
	start_grow()

func start_grow():
	animated_sprite.frame = 0
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(animated_sprite,"frame",frames_amount-1,growth_component.growth_time)
