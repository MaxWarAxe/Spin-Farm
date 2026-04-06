extends Node2D
class_name PlantView
@export var animated_sprite : AnimatedSprite2D
@export var growth_component : GrowthComponent
@export var cut_particles : GPUParticles2D
@export var growth_particles : GPUParticles2D
@onready var max_frames
var frames_amount

func _ready() -> void:
	growth_component.connect("grown",grown)
	growth_component.connect("reseted",cutted)
	frames_amount = animated_sprite.sprite_frames.get_frame_count(animated_sprite.animation)
	start_grow()

func cutted():
	cut_particles.emitting = true
	start_grow()

func start_grow():
	animated_sprite.frame = 0
	var tween : Tween = get_tree().create_tween()
	var total_frames = frames_amount - 1
	tween.tween_method(func(progress):
		animated_sprite.frame = int(progress * total_frames)
	, 0.0, 1.0, growth_component.growth_time)
func grown():
	growth_particles.emitting = true
